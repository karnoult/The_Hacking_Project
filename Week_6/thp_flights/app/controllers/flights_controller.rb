class FlightsController < ApplicationController
  def index
    if params_flights && params_flights[:departure_airport_id] && params_flights[:arrival_airport_id]
      @flights = Flight.search(params_flights)
    end
  end

  private

  def params_flights
    params[:airport].permit(:departure_airport_id, :arrival_airport_id) if params[:airport]
  end
end
