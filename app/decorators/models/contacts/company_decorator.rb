Contacts::Contact.class_eval do
  update_index 'invoice#invoice', :invoices
end
