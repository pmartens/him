class ChangeAgeForDevices < ActiveRecord::Migration
  def change
    remove_column :devices, :age
    add_column :devices, :age, :integer
  end
end
