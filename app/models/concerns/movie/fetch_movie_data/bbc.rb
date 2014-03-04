module Movie::FetchMovieData::BBC
  extend ActiveSupport::Concern

  module ClassMethods

    def get_bbc_movies
      JSON.parse(open(bbc_movies_url).read)
    end

    private

      def bbc_movies_url
        "http://www.bbc.co.uk/tv/programmes/formats/films/player/episodes.json"
      end

  end

end
