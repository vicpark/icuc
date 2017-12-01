$(document).on('turbolinks:load', function() {
    $('#demo').click(function() {
        checked = $("input[type=checkbox]:checked").length;
        if(!checked) {
        alert("You must check at least one checkbox.");
        location.reload();
        return false;
        }
        document.getElementById("demo").value = "Loading..."; 
        $('#slow_warning').show();
//         $('#slower_warning').show();
//         var iDiv = document.createElement('div');
//         iDiv.id = 'block';
//         iDiv.className = 'loader-wrapper';
//         document.getElementsByTagName('body')[0].appendChild(iDiv);
//         var innerDiv = document.createElement('div');
//         innerDiv.className = 'loader';
//         iDiv.appendChild(innerDiv);
//         $('body').addClass('loaded');
//         $('h1').css('color', '#222');
//         setTimeout(function(){
//         $('body').addClass('loaded');
//         $('h1').css('color', '#222');
//         }, 5000);
    });
    $('#options_Convolution_for_20_sized_letter').click( function(){
        var psf = document.getElementById("options_PSF").checked;
        var conv = document.getElementById("options_Convolution_for_20_sized_letter").checked;
        //making sure PSF is always checked when CONV is checked
        if (conv) {
            if (!psf) {
                document.getElementById("options_PSF").click();
            }
            else {
                return;
            }
        }
        //document.getElementById("options_PSF").click();
    });
    $('#options_PSF').click( function(){
        var psf = document.getElementById("options_PSF").checked;
        var conv = document.getElementById("options_Convolution_for_20_sized_letter").checked;
        //making sure PSF is always checked when CONV is checkd
        if (conv) {
            document.getElementById("options_PSF").click();
        }
    });
});
