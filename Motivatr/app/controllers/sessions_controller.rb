class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:username],
    params[:user][:password]
    )
    if @user
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["invalid credentials"]
      render :new
    end
  end

  def destroy
  end

end
