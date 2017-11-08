class MoussaillonsController < ApplicationController

  def index
    @moussaillons = Moussaillon.all
    # @number_of_gossips = Gossip.where("moussaillon_id = " + ).count
  end

  def new
    @moussaillon = Moussaillon.new
  end

  def create
    @moussaillon = Moussaillon.new

    @moussaillon.username = params_moussaillon[:username]
    @moussaillon.email = params_moussaillon[:email]

    if @moussaillon.save
      redirect_to moussaillons_path
    else
      render 'new'
    end
  end

  def show
    @moussaillon = Moussaillon.find(params[:id])
    @gossips = Gossip.where(moussaillon_id: params[:id])
  end

  def edit
    @moussaillon = Moussaillon.find(params[:id])
  end

  def update
    @moussaillon = Moussaillon.find(params[:id])

    if @moussaillon.update(params_moussaillon)
      redirect_to moussaillons_path
    else
      render 'edit'
    end
  end

  private
  def params_moussaillon
    params.require(:moussaillon).permit(:username, :email, :bio)
  end

end
