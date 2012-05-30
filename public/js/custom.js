// manipulate other amount
// from input text box
function grabData() {
  var amountValue = document.forms[0].fin_amount.value;

  if (amountValue == "others") {
    document.getElementById('others').innerHTML = "<input type='text' name='others' placeholder='Type amount here...'/>"; 
  } else {
    document.getElementById('others').innerHTML = ""; 
  }
}
