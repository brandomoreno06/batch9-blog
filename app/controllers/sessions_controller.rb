class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to articles_path, notice: "Logged in as #{user.username}"
    else
      flash.now[:error] = "Username and Password do not match!"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to articles_path, notice: "Successfully logged out."
  end
end
