json.href movie_url(@movie)
json.api movie_url(@movie) + ".json"
json.total 1
json.movies do
  json.id @movie.id
  json.href movie_url(@movie)
  json.api movie_url(@movie) + ".json"
  json.title @movie.title
  json.bbc_view_url @movie.watch_url
  json.movie_db_url @movie.movie_db_url
  json.image_url @movie.image_url
  json.poster_url @movie.poster_url
  json.backdrop_url @movie.backdrop_url
  json.expires_at @movie.expires_at
  json.synopsis @movie.synopsis
  json.rating @movie.rating
end
