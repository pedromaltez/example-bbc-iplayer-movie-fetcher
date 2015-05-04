BBC Movies information fetcher
==============================

Instructions
------------

### Dependencies

Most dependencies are listed in the Gemfile and handled by bundler.

Ensure you have installed:

* SQLite 3.6.16
* Ruby (2.2.0 was used here, but 2.0.0 and higher should be fine)
* Bundler gem

### Bundler

  Run `bundle install --path vendor/bundle` to install all Gemfile dependencies

### Keep your secrets secret (dotenv)

Get a [TheMovieDB API key][2] and place it in a file named `.env` in this app's root directory, formatted as below, where `h45hk3y` is your API key.

    THE_MOVIE_DB_API_KEY=h45hk3y

### Database setup

Run the following commands to set up the database:

    rake db:create
    rake db:migrate

### Start the server

  Run `rails s`

### Go to the server!

Visit [localhost:3000][3] with a JavaScript enabled web browser.

[1]: http://www.bbc.co.uk/tv/programmes/formats/films/player/episodes.json (BBC movies JSON response)
[2]: http:://www.themoviedb.org/ (Movie DB)
[3]: http://localhost:3000/ (Your machine, port 3000)
