class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search_user].present?
      @users = User.page(params[:page]).per(10).search_user(params[:search_user]).limit(20)
    elsif
      @users = User.page(params[:page]).per(10).limit(20)
   end
  end
  
  def show
    @user = User.find(params[:id])
    @plans = @user.plans.order(created_at: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
