require 'pry'

class HomeController < ApplicationController
  def index
    @map = Map.new
    @map.latitude = 45 # default value
    @map.longitude = 0 # default value
    @map.message = 'default marker' # default value
    # binding.pry
    return unless param_maps[:map] && param_maps[:map][:latitude] && param_maps[:map][:longitude] && param_maps[:map][:message]
    @map.latitude = param_maps[:map][:latitude]
    @map.longitude = param_maps[:map][:longitude]
    @map.message = param_maps[:map][:message]
  end

  def param_maps
    # [:latitude, :longitude] équivaut à %i[latitude longitude]
    params.permit(map: %i[latitude longitude message])
  end
end
