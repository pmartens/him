#require 'elasticsearch/model'

class Device < ActiveRecord::Base

  has_and_belongs_to_many :programs
  belongs_to :user
  belongs_to :cpu
  belongs_to :memory_module
  belongs_to :manufacturer
  belongs_to :device_type
  has_many :network_interface_cards
  has_many :attachments, as: :attachmentable
  has_many :documents, through: :attachments

  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :device_type, presence: true

  def age
      return 0 if self.purchased_at.nil?
      years = (Date.today - purchased_at) / 365
      years.to_f.round(2)
  end

  def ip_numbers
     self.network_interface_cards.map{|n| n.network_interfaces.withIp.map{|i| i.ip}}
  end

  def room_numbers
    self.network_interface_cards.map{|n| n.network_interfaces.withRoomnumber.map{|i| i.roomnumber}}
  end

  def mac_addresses
    self.network_interface_cards.map{|n| n.network_interfaces.withMac.map{|i| i.mac}}
  end

  def operating_systems
    self.programs.operating_systems.map{|p| p.full_title}
  end

end
