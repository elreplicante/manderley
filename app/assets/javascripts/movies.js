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