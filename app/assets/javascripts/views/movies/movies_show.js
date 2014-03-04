LetolabWebDeveloperTest.Views.Movie = Backbone.View.extend({
  template: HandlebarsTemplates["movies/show"],

  render: function() {
    this.$el.html(this.template({ movie: this.model }));
    return this;
  },
  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.model.fetch();
  }
});
