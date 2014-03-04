module Movie::ProcessMovieData::BBC
  extend ActiveSupport::Concern

  def image_url
    "http://ichef.bbci.co.uk/programmeimages/" + bbc_programme_image_pid +
    "/" + bbc_programme_pid + "_832_468.jpg" if bbc_programme_image_pid
  end

  def watch_url
    "http://www.bbc.co.uk/iplayer/episode/" + bbc_programme_pid
  end

  module ClassMethods
    def process_movie_data_bbc(bbc_movies)
      bbc_movies.each do |movie|
        current_movie = movie["programme"]

        # Create movies only once
        Movie.find_or_create_by(
          {
            title: current_movie["title"],
            bbc_programme_pid: current_movie["pid"],
            bbc_programme_image_pid: bbc_image_id(current_movie),
            synopsis: current_movie["short_synopsis"],
            duration: current_movie["duration"],
            available_at: convert_iso_time_string_to_ruby_time(current_movie["actual_start"]),
            expires_at: convert_iso_time_string_to_ruby_time(current_movie["available_until"])
          }
        )
      end
    end

    private

      def bbc_image_id(current_movie)
        if current_movie["image"]
          current_movie["image"]["pid"]
        end
      end

      def convert_iso_time_string_to_ruby_time(iso_time_string)
        Time.iso8601(iso_time_string)
      end

  end
end
