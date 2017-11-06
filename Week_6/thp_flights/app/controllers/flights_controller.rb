class FlightsController < ApplicationController
  def index
    @airports = Airport.all

    if params_flights && params_flights[:departure_airport_id] && params_flights[:arrival_airport_id]
      @departure_airport_code = Airport.find(params_flights[:departure_airport_id]).airport_code
      @arrival_airport_code = Airport.find(params_flights[:arrival_airport_id]).airport_code
      @flights = Flight.search(params_flights)
    end
  end

  private

  def params_flights
    params[:airport].permit(:departure_airport_id, :arrival_airport_id) if params[:airport]
  end
end
