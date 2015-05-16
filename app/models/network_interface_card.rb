class NetworkInterfaceCard < ActiveRecord::Base

  belongs_to :device
  has_many :network_interfaces

  def title
    "#{self.brand} #{self.chipset} (#{self.device_type})"
  end

end