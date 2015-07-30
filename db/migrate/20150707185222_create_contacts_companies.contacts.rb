# This migration comes from contacts (originally 20150707183005)
class CreateContactsCompanies < ActiveRecord::Migration
  def change
    create_table :contacts_companies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
