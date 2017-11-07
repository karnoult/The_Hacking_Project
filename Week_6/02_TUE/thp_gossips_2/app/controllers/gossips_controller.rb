class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new
    @gossip.content = params_gossip[:content]
    @gossip.creator = current_user
    @gossip.creation_datetime = Time.zone.now

    if @gossip.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
  end

  private

  def params_gossip
    params.require(:gossip).permit(:content)
  end

end
