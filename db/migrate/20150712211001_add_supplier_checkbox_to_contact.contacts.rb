# This migration comes from contacts (originally 20150712210312)
class AddSupplierCheckboxToContact < ActiveRecord::Migration
  def change
    add_column :contacts_contacts, :supplier, :boolean
  end
end
