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
    @gossip.creator_id = User.find(params_gossip[:creator_id])
    @gossip.creation_datetime = params_gossip[:creation_datetime]

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
    params.require(:gossip).permit(:content, :creator_id, :creation_datetime)
  end

end
