class HomeController < ApplicationController
  def index
    @latitude = 45 # default value
    @longitude = 0 # default value
    @message = 'default marker' # default value
    return unless param_maps && param_maps[:map] && param_maps[:map][:latitude] && param_maps[:map][:longitude]
    @latitude = param_maps[:map][:latitude]
    @longitude = param_maps[:map][:longitude]
    @message = param_maps[:map][:message]
  end

  def param_maps
    # [:latitude, :longitude] équivaut à %i[latitude longitude]
    params.permit(map: %i[latitude longitude message])
  end
end
