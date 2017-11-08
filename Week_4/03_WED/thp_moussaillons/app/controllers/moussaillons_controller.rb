class MoussaillonsController < ApplicationController

  def new
    @moussaillon = Moussaillon.new
  end

  def create
    @moussaillon = Moussaillon.new(moussaillon_params)
    @moussaillon.save
    redirect_to root_path
  end

  def edit
    @moussaillon = Moussaillon.find(params[:id])
  end

  def update
    @moussaillon = Moussaillon.find(params[:id])
    @moussaillon.first_name = moussaillon_params[:first_name]
    @moussaillon.age = moussaillon_params[:age]
    @moussaillon.save
    redirect_to root_path
  end

  def destroy
    @moussaillon = Moussaillon.find(params[:id])
    @moussaillon.destroy
    redirect_to root_path
  end

  def show
    @moussaillon = Moussaillon.find(params[:id])
  end

  def index
    @moussaillons = Moussaillon.all
  end

  private
  def moussaillon_params
    params[:moussaillon].permit(:first_name, :age, :likeness, :bio, :slack_handle, :github_handle)
  end

end
