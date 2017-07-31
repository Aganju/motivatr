class GoalsController < ApplicationController

  def index
    @goals = Goal.find_by(user_id: params[:user_id])
  end

  def new
  end

  def create
    @goal = Goal.new(goals_params)
    # debugger
    if @goal.save
      redirect_to goal_url(@goal)
    else
      render :new
    end
  end

  def show
    @goal = Goal.find_by(id: params[:id])
  end

  def update
    #if goal.user_id != current_user.id
  end


  def goals_params
    params.require(:goal).permit(:body, :private, :user_id)
  end
end
