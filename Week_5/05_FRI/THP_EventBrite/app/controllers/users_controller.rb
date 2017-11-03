class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params_user(:name)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @users = User.all
  end

  private

  def params_user
    params.require(:user).permit(:name)
  end

end
