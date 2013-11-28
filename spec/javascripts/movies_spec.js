// include spec/javascripts/helpers/spec_helper.js and app/assets/javascripts/foo.js
//= require movies
//= require helpers/spec_helper

describe('Movies list', function() {
  it("loads a list of movies ", function() {
    var client = { readMovies: function() { } };
    var movieList = new MovieList(client);
    spyOn(client, 'readMovies');

    movieList.getMovies();

    expect(client.readMovies).toHaveBeenCalled();
  });

  describe("client", function(){

  });
});