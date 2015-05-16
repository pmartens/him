class AddSecondFieldsToDevices < ActiveRecord::Migration
  def change
    add_belongs_to :devices, :user
    add_column :devices, :color, :string
    add_column :devices, :number_of_cpu, :integer
    add_column :devices, :number_of_mem, :integer
    add_column :devices, :features, :text
    add_column :devices, :information, :text
  end
end
