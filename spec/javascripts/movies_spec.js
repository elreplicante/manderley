// include spec/javascripts/helpers/spec_helper.js and app/assets/javascripts/foo.js
//= require movies
//= require helpers/spec_helper

describe('Movies list', function() {
    it("loads a list of movies ", function() {
        var client = { readMovies: function() { } };
        var list = movieList(client);
        spyOn(client, 'readMovies');

        list.getMovies();

        expect(client.readMovies).toHaveBeenCalled();
    });


    xit("receives a list of movies from the client", function(){
        var falseData = [{id: 1, name: "Blade Runner"}];
        var client = { readMovies: function(callback) {
            callback(falseData); 
        }};

        var widget = { draw: function() { } };
        var list = movieList(client, widget);
        spyOn(widget, 'draw');

        list.getMovies();

        expect(widget.draw).toHaveBeenCalled();
    });
  });


describe('Map', function() {
    it("loads a list of movies ", function() {
        var center = { lat: 0.000, lon: 0.000 };
    });

  });
