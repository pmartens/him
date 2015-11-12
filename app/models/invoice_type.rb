class InvoiceType < ActiveRecord::Base

  belongs_to :invoice
  belongs_to :user

  update_index 'invoice#invoice', :invoice

end
