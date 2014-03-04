module Movie::ProcessMovieData::TheMovieDB
  extend ActiveSupport::Concern

  def poster_url
    movie_db_image_url(movie_db_poster_path) if movie_db_poster_path
  end

  def backdrop_url
    movie_db_image_url(movie_db_backdrop_path) if movie_db_backdrop_path
  end

  def movie_db_url
    "http://www.themoviedb.org/movie/" + movie_db_id.to_s if movie_db_id
  end

  private

    def movie_db_image_url(image_path)
      "http://image.tmdb.org/t/p/original" + image_path
    end

  module ClassMethods
    def process_movie_data_the_movie_db(current_movies)
      current_movies.each do |movie|
        if movie_db_result(movie)
          current_movie = movie_db_result(movie)

          movie.movie_db_id = current_movie["id"] || nil
          movie.movie_db_poster_path = current_movie["poster_path"] || nil
          movie.movie_db_backdrop_path = current_movie["backdrop_path"] || nil
          movie.rating = rating(current_movie) || nil
          movie.save
          @movie_result = false
        end
      end
    end

    private

      def movie_db_result(movie)
        # Assume first result is the desired result
        @movie_result ||= search_movie_db(movie.title)["results"][1]
      end

      def rating(movie)
        if movie["vote_average"]
          movie["vote_average"].to_f
        end
      end

  end

end

