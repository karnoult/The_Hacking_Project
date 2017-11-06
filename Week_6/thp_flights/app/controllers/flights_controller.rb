class FlightsController < ApplicationController
  def index

    # return if no params
    params = params_flights
    return if !params

    # get all airports for the select field
    @airports = Airport.all

    from_id = params_flights[:departure_airport_id].to_i
    to_id = params_flights[:arrival_airport_id].to_i

    # retrieve airport codes if IDs passed as parameters
    @departure_airport_code = Airport.find(from_id).airport_code if from_id > 0
    @arrival_airport_code = Airport.find(to_id).airport_code if to_id > 0

    # search flights related to specified IDs
    @flights = Flight.search(from_id, to_id)
  end

  private

  def params_flights
    params[:airport].permit(:departure_airport_id, :arrival_airport_id) if params[:airport]
  end
end
