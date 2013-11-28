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


var MovieList = function(client) {
    var getMovies = function() {
        client.readMovies();
    };

    return { getMovies: getMovies }
}