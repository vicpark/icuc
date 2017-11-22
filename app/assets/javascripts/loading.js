// setTimeout(function(){
//   $('body').addClass('loaded');
//   $('h1').css('color', '#222');
// }, 100);

$(document).ready(function() {
    $('#demo').click(function() {
        document.getElementById("demo").value = "Loading..."; 
        //$('#slow_warning').show();
        //$('#slower_warning').show();
//         setTimeout(function(){
//         $('body').addClass('loaded');
//         $('h1').css('color', '#222');
//         }, 5000);
    });
})
