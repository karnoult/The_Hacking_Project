class WelcomeController < ApplicationController
  def home
  end

  def secret_page
    if !logged_in?
      flash[:danger] = 'Faut être loggé pour aller sur la page secrète !!!'
      redirect_to root_path
    end
  end
end
