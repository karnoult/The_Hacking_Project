require 'themoviedb'

class MovieDb
  def initialize(title)
    @title = title
    Tmdb::Api.key(ENV['moviedb_secret'])
    Tmdb::Api.language('fr')
  end

  def perform
    Tmdb::Movie.find(@title)
  end
end
