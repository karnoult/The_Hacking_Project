class StaticPagesController < ApplicationController
  def about
    @name = params[:id]
  end
end
