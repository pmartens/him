# This migration comes from contacts (originally 20150707182939)
class CreateContactsEmails < ActiveRecord::Migration
  def change
    create_table :contacts_emails do |t|
      t.string :emailtype
      t.string :email

      t.timestamps null: false
    end
  end
end
