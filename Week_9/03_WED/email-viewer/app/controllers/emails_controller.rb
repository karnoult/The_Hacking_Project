class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def delete
    @email = Email.destroy(params[:id])
    @emails = Email.all

    respond_to do |format|
      format.js
    end
  end

  def show_content
    @email = Email.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end
