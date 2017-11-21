// setTimeout(function(){
//   $('body').addClass('loaded');
//   $('h1').css('color', '#222');
// }, 100);

$(document).ready(function() {
    $('#demo').click(function() {
        $('#slow_warning').show();
        $('#slower_warning').show();
        setTimeout(function(){
        $('body').addClass('loaded');
        $('h1').css('color', '#222');
        }, 100);
    });
})
