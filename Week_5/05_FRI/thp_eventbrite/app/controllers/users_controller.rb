class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params_user[:name]
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def params_user
    params.require(:user).permit(:name, :password,
                                   :password_confirmation)
  end

end
