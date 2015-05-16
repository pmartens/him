class NetworkInterface < ActiveRecord::Base

  belongs_to :network_interface_card

  scope :withIp, -> {where.not(ip: '' )}
  scope :withRoomnumber, -> {where.not(roomnumber: '' )}
  scope :withMac, -> {where.not(mac: '' )}

  validates :ip, uniqueness: true, length: { maximum: 15  }
end
