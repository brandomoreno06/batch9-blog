class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]
  before_action :account_owner?, only: [:show, :destroy]
  before_action :verify_logged_in, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    
    if @user.save
      flash[:notice] = 'Successfully registered. You may now sign in.'
      redirect_to login_path
    else
      flash.now[:error] = @user.errors.full_messages.join(' -------- ')
      render :new
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to home_path
  end
  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end

  def account_owner?
    redirect_to home_path and return unless current_user.try{id} == @user.id
  end

  def find_user
    @user = User.find(params[:id])
  end

  def verify_logged_in
    redirect_to home_path, notice: "You already have an existing account" if user_logged_in?
  end
end
