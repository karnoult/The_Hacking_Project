class PagesController < ApplicationController
  def index
    redirect_to new_user_registration_path if !user_signed_in?
  end
end
