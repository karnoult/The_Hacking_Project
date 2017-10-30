class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      flash[:danger] = 'You cannot edit someone else than yourself'
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
