class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :bbc_programme_pid
      t.string :bbc_programme_image_pid
      t.string :movie_db_id
      t.string :movie_db_poster_path
      t.string :movie_db_backdrop_path
      t.string :synopsis
      t.integer :duration
      t.float :rating
      t.datetime :available_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
