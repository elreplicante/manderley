$(document).ready(function() {
    $('#add-comment').on('click', function(event) {
        $('.comment-form').css('display', 'block');
        $('.cast-form').css('display', 'none');

    });    
})

$(document).ready(function() {
    $('#add-person').on('click', function(event) {
     $('.cast-form').css('display', 'block');
     $('.comment-form').css('display', 'none');

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

function destroyMovie() {
    $.ajax('movies/<%= dom_id(resource)',
    { type: 'DELETE',
    success: function(){
        //Do something
    } }
    );
}



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