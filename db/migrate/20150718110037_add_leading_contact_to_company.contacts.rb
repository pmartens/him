# This migration comes from contacts (originally 20150712211952)
class AddLeadingContactToCompany < ActiveRecord::Migration
  def change
    add_column :contacts_companies, :main_contact_id, :int
  end
end
