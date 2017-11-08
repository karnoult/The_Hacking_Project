class FlightsController < ApplicationController
  def index

    # return if no params
    params = params_flights

    # get all airports for the select field
    @airports = Airport.all

    return if params == {}

    from_id = params[:airport][:departure_airport_id].to_i
    to_id = params[:airport][:arrival_airport_id].to_i
    departure_date = params[:departure_date]

    # retrieve airport codes if IDs passed as parameters
    @departure_airport_code = Airport.find(from_id).airport_code if from_id > 0
    @arrival_airport_code = Airport.find(to_id).airport_code if to_id > 0

    # search flights related to specified IDs
    @flights = Flight.search(from_id, to_id, departure_date)
  end

  private

  def params_flights
    params.permit({ airport: [:departure_airport_id, :arrival_airport_id] }, :departure_date)
  end
end
