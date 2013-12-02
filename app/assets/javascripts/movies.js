// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $('#add-comment').on('click', function(event) {
        $('.comment-form').css('display', 'block');
    });    
})

$(document).ready(function() {
    $('#add-person').on('click', function(event) {
       $('.cast-form').css('display', 'block');
    });
});

$.ajax({
    dataType: "json",
    url: "movies/",
    success: function(data){
        var $select = $("<select>");

        $.each(data, function(key, value){
            var $option = $("<option>", {text: value.title});
            $select.append($option);
        });

        $select.prependTo("body");
    }
    }
);

function movieList(client, widget) {
    var self = {};

     self.getMovies = function() {
        client.readMovies();
    };

    var drawMovies = function(movies) {
        widget.draw(movies);
    }

    return self;
};

function client() {
    self.readMovies = function(callback){
        $.get("movies", function(data) {
            callback(data);
        });
    };

    return self;
};

function widget() {
    self.draw = function(movies) {

    };

    return self;
};