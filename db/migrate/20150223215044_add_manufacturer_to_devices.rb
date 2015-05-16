class AddManufacturerToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :manufacturer, :string
  end
end
