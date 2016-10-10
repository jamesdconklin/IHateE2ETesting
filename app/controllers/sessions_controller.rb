class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    up =user_params
    @user = User.find_by_credentials(up[:username],up[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
