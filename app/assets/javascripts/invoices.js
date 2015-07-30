$(document).ready(function() {
  $("#invoice_type a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');

  $('#invoice_type').bind('cocoon:after-insert',
     function() {
       $("#invoice_type_from_list").hide();
       $("#invoice_type a.add_fields").hide();
     });
  $('#invoice_type').bind("cocoon:after-remove",
     function() {
       $("#invoice_type_from_list").show();
       $("#invoice_type a.add_fields").show();
     });
});
