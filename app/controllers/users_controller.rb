class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      render :show
    else
      flash[:errors] = ["user not found"]
      redirect_to users_url
    end
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end


end
