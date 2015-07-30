class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :invoicenumber
      t.timestamp :invoicedate
      t.string :state
      t.timestamps null: false
    end
  end
end
