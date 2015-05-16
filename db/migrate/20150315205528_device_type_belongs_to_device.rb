class DeviceTypeBelongsToDevice < ActiveRecord::Migration
  def change
    remove_column :devices, :age
    remove_column :devices, :manufacturer
    add_belongs_to :devices, :manufacturer
    add_belongs_to :devices, :device_type
  end
end
