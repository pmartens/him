$(document).ready(function() {
  $("#document a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');

  $('#document').bind('cocoon:after-insert',
     function() {
       $("#invoice_type_from_list").hide();
       $("#invoice_type a.add_fields").hide();
     });
  $('#document').bind("cocoon:after-remove",
     function() {
       $("#document_from_list").show();
       $("#document a.add_fields").show();
     });
});
