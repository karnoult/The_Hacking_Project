class FlightsController < ApplicationController
  def index
    @flights = []
    if params_flights && params_flights[:departure_airport_id] && params_flights[:arrival_airport_id]
      @flights = Flight.search(params_flights)
    else
      @flights = Flight.first(5)
    end
  end

  private

  def params_flights
    params[:airport].permit(:departure_airport_id, :arrival_airport_id) if params[:airport]
  end
end
