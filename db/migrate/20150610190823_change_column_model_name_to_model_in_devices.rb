class ChangeColumnModelNameToModelInDevices < ActiveRecord::Migration
  def change
    rename_column :devices, :model_name, :device_model
  end
end
