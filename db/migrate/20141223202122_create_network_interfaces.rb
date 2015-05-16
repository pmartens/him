class CreateNetworkInterfaces < ActiveRecord::Migration
  def change
    create_table :network_interfaces do |t|
      t.string :roomnumber
      t.string :interface
      t.string :ip
      t.string :subnet
      t.string :router
      t.string :dns
      t.string :ip6
      t.string :router6
      t.string :prefix
      t.string :domains
      t.string :mac
      t.string :speed
      t.string :duplex
      t.boolean :dhcp
      t.integer :vlan
      t.boolean :online

      t.timestamps
    end
  end
end
