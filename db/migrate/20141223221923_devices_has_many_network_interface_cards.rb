class DevicesHasManyNetworkInterfaceCards < ActiveRecord::Migration
  def change
    add_belongs_to :network_interface_cards, :device
  end
end
