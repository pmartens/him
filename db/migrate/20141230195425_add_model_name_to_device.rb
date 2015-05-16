class AddModelNameToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :model_name, :string
  end
end
