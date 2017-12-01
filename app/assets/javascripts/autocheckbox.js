var chk1 = $("input[type='checkbox'][name = 'options[Convolution for 20 sized letter]']");
var chk2 = $("input[type='checkbox'][name='options[PSF]']");

chk1.on('change', function(){
  chk2.prop('checked',this.checked);
});
