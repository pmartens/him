class InvoiceType < ActiveRecord::Base

  belongs_to :invoice
  belongs_to :user

  update_index('invoices#invoice') { invoice }
  update_index 'invoice#invoice', :invoices

end
