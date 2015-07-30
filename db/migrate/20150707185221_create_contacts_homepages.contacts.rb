# This migration comes from contacts (originally 20150707182952)
class CreateContactsHomepages < ActiveRecord::Migration
  def change
    create_table :contacts_homepages do |t|
      t.string :type
      t.string :url

      t.timestamps null: false
    end
  end
end
