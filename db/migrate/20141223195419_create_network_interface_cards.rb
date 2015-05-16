class CreateNetworkInterfaceCards < ActiveRecord::Migration
  def change
    create_table :network_interface_cards do |t|
      t.string :brand
      t.string :device_type
      t.string :chipset
      t.string :transfer_rate
      t.string :interface

      t.timestamps
    end
  end
end
