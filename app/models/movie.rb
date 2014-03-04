class Movie < ActiveRecord::Base
  include Movie::FetchMovieData
  include Movie::ProcessMovieData

  scope :currently_available, lambda { where("expires_at >= ?", Time.now) }
  scope :not_processed_by_movie_db, lambda { where(:movie_db_id => nil) }

  class << self

    def get_new_movies
      bbc_movie_response = get_bbc_movies["episodes"]
      process_movie_data_bbc(bbc_movie_response)
      process_movie_data_the_movie_db(movies_to_process_by_movie_db)
    end

    private

      # Do not process movies that have already been processed
      def movies_to_process_by_movie_db
        Movie.currently_available && Movie.not_processed_by_movie_db
      end

  end

end
