class CreateInvoiceType < ActiveRecord::Migration
  def change
    create_table :invoice_types do |t|
      t.string :name

      t.timestamps null: false
    end
    add_belongs_to :invoices, :invoice_type
    add_belongs_to :invoice_types, :user

  end
end
