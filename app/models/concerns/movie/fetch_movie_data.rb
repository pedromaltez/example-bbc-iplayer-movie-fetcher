module Movie::FetchMovieData
  extend ActiveSupport::Concern
  include Movie::FetchMovieData::BBC

  require "open-uri"
  require "json"

end
