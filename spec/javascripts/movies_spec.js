// include spec/javascripts/helpers/spec_helper.js and app/assets/javascripts/foo.js
//= require movies
//= require helpers/spec_helper

describe('Movies', function() {
  it("loads a list of movies ", function() {
    var client = { retrieveMovies: function() {}; };
    spyOn(client, 'retrieveMovies');
  });
});