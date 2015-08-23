class ChangeReferencesToInvoice < ActiveRecord::Migration
  def change
    remove_reference :invoices, :contact, index: true
    add_belongs_to :invoices, :supplier
  end
end
