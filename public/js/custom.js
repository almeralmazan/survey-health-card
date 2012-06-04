$(document).ready( function() {
  $('#no_answer').click( function() {
    if ($(this).is(':checked')) {
      $('#six-chbox-one-input-text').slideToggle('slow'); 
      $('input[name=ape], input[name=ipc], input[name=opc], input[name=ec], input[name=dc], input[name=fca]').attr('checked', false);

      $('input[name=others]').val('');

    } else {
      $('#six-chbox-one-input-text').slideToggle('slow'); 
    }
  });

  // assuming your form has id="theform"
  // defines a callback on submission of the form #theform
  $('#theform').submit( function() {
    // posts the contents of the form to /create using ajax
    $.post('/create', $('#theform').serialize(), function(result) {
      // assuming result is a string of the updated data in html
      // and assuming that your data goes in an element with the id main-content
      $('#main-content').html(result)
      //var conf = confirm('Successfully created');
      //if (conf) window.location.reload(true); 
    }); 
    return false; // prevents the form from submitting normally
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
