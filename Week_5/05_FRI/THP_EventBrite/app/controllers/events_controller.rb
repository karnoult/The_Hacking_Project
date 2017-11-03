class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.desc = params_event[:desc]
    @event.place = params_event[:place]
    @event.date = params_event[:date]
    @event.creator = User.find(params_event[:creator_id])

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def params_event
    params.require(:event).permit(:desc, :place, :date, :creator_id)
  end
end
