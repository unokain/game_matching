class PlansController < ApplicationController
    before_action :set_plan, only: [:show, :edit, :update, :destroy, :take, :cancel ]
    before_action :authenticate_user!
    before_action :ensure_current_user_plan, {only: [:edit, :update, :destroy]}

    def index
      if params[:tag].present?
        @plans = Plan.page(params[:page]).per(8).tagged_with(params[:tag]).order(created_at: :desc)
      elsif params[:search].present?
        @plans = Plan.plans_search(params[:search]).page(params[:page]).per(8).limit(20)
      elsif params[:sort_start].present?
        @plans = Plan.sort_start.page(params[:page]).per(8)
      elsif
        @plans = Plan.all.order(created_at: :desc).page(params[:page]).per(8)
      end
      @tags = Plan.tag_counts_on(:tags).most_used(20)
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
      InformationMailer.information_mail(@plan).deliver 
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

    def ensure_current_user_plan
      if current_user.id != @plan.user_id
        flash[:notice]="権限がありません"
        redirect_to plans_path
      end
    end

  #   def time_limit_divide
  #     plan_array = Plan.new
  #     time = Time.now
  #     array_plan_limit=[]
  #     array_plan_unlimit=[]
  #     plan_array.each do |plan|
  #         if @time >= plan[:limit_time]
  #             array_plan_limit << plan
  #         else
  #             array_plan_unlimit << plan
  #         end
  #     end
  #     array_plan_unlimit << array_plan_limit
  #     @plans = array_plan_unlimit.flatten!
  # end
end
