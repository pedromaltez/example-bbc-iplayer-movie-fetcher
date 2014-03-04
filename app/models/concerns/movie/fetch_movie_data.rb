module Movie::FetchMovieData
  extend ActiveSupport::Concern
  include Movie::FetchMovieData::BBC
  include Movie::FetchMovieData::TheMovieDB

  require "open-uri"
  require "json"

end
