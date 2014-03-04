module Movie::ProcessMovieData
  extend ActiveSupport::Concern
  include Movie::ProcessMovieData::BBC
  include Movie::ProcessMovieData::TheMovieDB

end
