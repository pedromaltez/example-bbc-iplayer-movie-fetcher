window.LetolabWebDeveloperTest = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    movies = new LetolabWebDeveloperTest.Collections.Movies();

    new LetolabWebDeveloperTest.Routers.Movies({ movies: movies});
    Backbone.history.start({pushState: true});

    MoviesIndexView = new LetolabWebDeveloperTest.Views.MoviesIndex({
      collection: movies,
      el: $("#movies_container")
    });

    MoviesIndexView.render();
  }
};

$(document).ready(function(){
  LetolabWebDeveloperTest.initialize();
});
