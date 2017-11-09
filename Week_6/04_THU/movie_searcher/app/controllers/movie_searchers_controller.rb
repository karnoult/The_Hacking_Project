class MovieSearchersController < ApplicationController
  def index
    params = params_movie
    return if params == {}
    @movies = MovieDb.new(params_movie[:search_movie][:title]).perform
    configuration = Tmdb::Configuration.new
    @img_url = configuration.base_url + configuration.poster_sizes[2]
  end

  private

  def params_movie
    params.permit(search_movie: [:title])
  end
end
