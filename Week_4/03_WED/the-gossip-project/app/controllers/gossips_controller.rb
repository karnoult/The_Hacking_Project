class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def index
    @gossips = Gossip.all
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to @gossip
    else
      redirect_to new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.anonymous_author = gossip_params[:anonymous_author]
    @gossip.content = gossip_params[:content]
    if @gossip.save
      redirect_to @gossip
    else
      redirect_to edit_gossip_path
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private
  def gossip_params
    params[:gossip].permit(:anonymous_author, :content)
  end

end
