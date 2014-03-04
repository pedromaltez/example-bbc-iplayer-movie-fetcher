require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module LetolabWebDeveloperTest
  class Application < Rails::Application
    config.assets.paths << "#{ Rails.root }/app/assets/templates"

    config.after_initialize do

      # This gets new movies on server start.
      # It's in a rescue block to prevent it from
      # causing an exception during migrations when
      # the Movie table doesn't yet exist
      begin
        Movie.get_new_movies
      rescue
      end

    end
  end
end
