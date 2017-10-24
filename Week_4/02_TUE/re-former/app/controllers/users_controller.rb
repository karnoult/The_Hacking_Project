class UsersController < ApplicationController
  def new
    # used for form_for
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(article_params)

    @user.save
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.username = article_params[:username]
    @user.email = article_params[:email]
    @user.bio = article_params[:bio]

    @user.save
    redirect_to @user
  end

  private
  def article_params
    # params.permit(:username, :email, :bio)
    params[:user].permit(:username, :email, :bio)
  end
end
