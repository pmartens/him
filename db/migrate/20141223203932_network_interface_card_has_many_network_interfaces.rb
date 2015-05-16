class NetworkInterfaceCardHasManyNetworkInterfaces < ActiveRecord::Migration
  def change
    add_belongs_to :network_interfaces, :network_interface_card
  end
end
