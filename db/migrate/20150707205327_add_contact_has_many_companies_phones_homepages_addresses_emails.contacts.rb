# This migration comes from contacts (originally 20150707185651)
class AddContactHasManyCompaniesPhonesHomepagesAddressesEmails < ActiveRecord::Migration
  def change
    add_belongs_to :contacts_contacts, :company
    add_belongs_to :contacts_homepages, :contact
    add_belongs_to :contacts_phones, :contact
    add_belongs_to :contacts_emails, :contact
    add_belongs_to :contacts_addresses, :contact
  end
end
