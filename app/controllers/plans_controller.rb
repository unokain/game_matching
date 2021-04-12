class PlansController < ApplicationController
    before_action :set_plan, only: [:show, :edit, :update, :destroy, :take, :cancel ]
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy] 

    def index
      if params[:tag]
        @plans = Plan.tagged_with(params[:tag])
        @tags = Plan.tag_counts_on(:tags).most_used(20)
      else
        @plans = Plan.all 
        @tags = Plan.tag_counts_on(:tags).most_used(20)
      end
    end

    def new
      if params[:back]
        @plan = Plan.new(plan_params)
      else
        @plan = Plan.new
      end
    end

    def create
      @plan = Plan.new(plan_params)
      @plan.user_id = current_user.id
      if params[:back]
        render :new
      else
        if @plan.save
          redirect_to plans_path
        else
          render :new
        end
      end
    end

    def show
    #   @plan = Plan.find(params[:id])
      @comments = @plan.comments
      @comment = @plan.comments.build
      @tags = @plan.tag_counts_on(:tags)
      @user = @plan.user
      @plan_user = @plan.takers
    end

    def edit
    end

    def update
      if @plan.update(plan_params)
        redirect_to plans_path
      else
        render :edit
      end
    end

    def destroy
      @plan.destroy
      redirect_to plans_path
    end

    def confirm
      @plan = current_user.plans.build(plan_params)
      render :new if @plan.invalid?
    end

    def take
      PlanUser.create(plan_id: @plan.id, taker_id: current_user.id)
      flash[:notice] = '申し込みが完了しました。'
      redirect_to action: "show"
    end

    def cancel
      plan_taker = PlanUser.find_by(plan_id: @plan.id, taker_id: current_user.id)
      plan_taker.destroy
      flash[:notice] = 'キャンセルが完了しました。'
      redirect_to action: "show"
    end

    private
    def plan_params
      params.require(:plan).permit(:title, :content, :start_time, :limit_time, :tag_list)
    end
    
    def set_plan
     @plan = Plan.find(params[:id])
    end
end
