$(document).ready( function() {
  $('#no_answer').click( function() {
    if ($(this).is(':checked')) {
      $('#six-chbox-one-input-text').slideToggle('slow'); 
      $('.cbox').attr('checked', false);

      $('input[name=others]').val('');

    } else {
      $('#six-chbox-one-input-text').slideToggle('slow'); 
    }
  });

});


// manipulate other amount
// from input text box
function createInputTextBox() {
  var amountValue = document.forms[0].fin_amount.value;

  if (amountValue == "others") {
    document.getElementById('others').innerHTML = "<input type='text' name='fin_amount' placeholder='Type amount here...' style='margin-left: 15px;' />"; 
  
  } else {
    document.getElementById('others').innerHTML = ""; 
  }
}


// customize textarea
function setbg(color) {
  document.getElementById("styled").style.background=color;
}
