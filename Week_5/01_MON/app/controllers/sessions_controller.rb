class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params_session[:email].downcase)
    if user && user.authenticate(params_session[:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  private

  def params_session
    params.require(:session).permit(:email, :password)
  end
end
