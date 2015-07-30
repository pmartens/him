class AddUserToContacts < ActiveRecord::Migration
  def change
    add_belongs_to :contacts_contacts, :user
  end
end
