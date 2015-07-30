class AddReferencesToInvoice < ActiveRecord::Migration
  def change
    add_belongs_to :invoices, :user
    add_belongs_to :invoices, :contact
    add_belongs_to :documents, :invoice
  end
end
