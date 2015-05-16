class AddFieldsToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :purchased_at, :date
    add_column :devices, :age, :date
    add_column :devices, :serialnumber, :string
    add_column :devices, :servicetag, :string
  end
end
