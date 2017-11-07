class EventsController < ApplicationController
  ...

  private

  def params_event
    params.require(:event).permit(:desc, :place, :date, :creator_id)
  end
end
