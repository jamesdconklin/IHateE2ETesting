class GoalsController < ApplicationController

  def show
    @goal = Goal.find_by(id: params[:id])
    if @goal
      render :show
    else
      flash[:errors] = ["goal not found"]
      redirect_to users_url
    end
  end

  def new
    @goal = Goal.new
  end


  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = params[:user_id]
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to new_user_goal_url(params[:user_id])
    end
  end

  def edit
    @goal = Goals.find_by_id(params[:id])
    if @goal
      render :edit
    else
      flash[:errors] = ["goal not found"]
      redirect_to users_url
    end
  end

  def update
    @goal = Goals.find_by_id(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to edit_goal_url(@goal)
    end
  end

  def destroy
    goal = Goals.find_by_id(params[:id])
    if goal
      goal.destroy
      redirect_to user_url(goal.user)
    else
      flash[:errors] = ["goal not found"]
      redirect_to users_url
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:title, :private, :completed, :details)
  end


end
