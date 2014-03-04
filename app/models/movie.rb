class Movie < ActiveRecord::Base
  include Movie::FetchMovieData
  include Movie::ProcessMovieData

  class << self

  end

end
