LetolabWebDeveloperTest.Collections.Movies = Backbone.Collection.extend({
  model: LetolabWebDeveloperTest.Models.Movie,
  url: "/movies",
  parse: function(response){
    return response.movies;
  }
});
