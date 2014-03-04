LetolabWebDeveloperTest.Views.MoviesIndex = Backbone.View.extend({
  template: HandlebarsTemplates["movies/index"],

  render: function() {
    this.$el.html(this.template({ movies: this.collection }));
    return this;
  },
  initialize: function() {
    this.listenTo(this.collection, "add", this.render);
    this.collection.fetch();
  }
});
