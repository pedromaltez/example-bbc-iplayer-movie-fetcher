module Movie::FetchMovieData::TheMovieDB
  extend ActiveSupport::Concern
  require "cgi"

  module ClassMethods

    def search_movie_db(movie_title)
      JSON.parse(open(movie_db_search_url(movie_title)).read)
    end

    def get_movie_db(movie_db_id)
      JSON.parse(open(movie_db_get_url(movie_db_id)).read)
    end

    private
      def movie_db_api_key
        @movie_db_api_key ||= ENV["THE_MOVIE_DB_API_KEY"]
      end

      def movie_db_search_url(movie_title)
        "https://api.themoviedb.org/3/search/movie?query=" +
        cgi_escaped_movie_title_string(movie_title) + "&" +
        movie_db_api_key_query_string
      end

      def movie_db_get_url(movie_db_id)
        "https://api.themoviedb.org/3/movie/" +
        movie_db_id + "?" + movie_db_api_key_query_string
      end

      def movie_db_api_key_query_string
        "api_key=" + movie_db_api_key.to_s
      end

      def cgi_escaped_movie_title_string(movie_title)
        CGI::escape(movie_title)
      end

  end

end
