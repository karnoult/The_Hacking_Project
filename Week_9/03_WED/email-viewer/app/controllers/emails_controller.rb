class EmailsController < ApplicationController
  def index
    @emails = Email.order('id').all
  end

  def delete
    @email = Email.destroy(params[:id])
    @emails = Email.order('id').all
  end

  def show_content
    @email = Email.find(params[:id])
    @emails = Email.order('id').all
    unless @email.read
      @email.read = 1
      @email.save
    end
  end
end
