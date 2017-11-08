class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new

    @gossip.body = params_gossip[:body]
    @gossip.moussaillon = Moussaillon.find(params[:moussaillon_id])

    if @gossip.save
      redirect_to moussaillon_path(@gossip.moussaillon.id)
    else
      render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(params_gossip)
      redirect_to moussaillon_path(@gossip.moussaillon.id)
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    moussaillon_id = @gossip.moussaillon.id
    @gossip.destroy
    redirect_to moussaillon_path(moussaillon_id)
  end

  private
  def params_gossip
    params.require(:gossip).permit(:moussaillon, :body)
  end

end
