class PlansController < ApplicationController
    before_action :set_plan, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy] #ログインしたユーザーのみ
    def index
      @plans = Plan.all 
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
    #   @plan.user_id = current_user.id
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
    end
    def edit
    #   @plan = Plan.find(params[:id])
    end
    def update
    #  @plan = Plan.find(params[:id])
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
    # def confirm
     # @plan = current_user.plans.build(plan_params)
     # render :new if @plan.invalid?
    # end
    private
    def plan_params
      params.require(:plan).permit(:title, :content, :start_time, :limit_time)
    end
    def set_plan
     @plan = Plan.find(params[:id])
    end
end
