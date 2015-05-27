class NetworkInterfacesController < ApplicationController

  add_breadcrumb :index_devices, :devices_path
  add_breadcrumb :index, :device_network_interface_cards_path
  add_breadcrumb :index, :device_network_interface_card_network_interfaces_path

  before_action :set_device
  before_action :set_network_interface_card
  before_action :set_network_interface, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @network_interfaces = NetworkInterface.where  :network_interface_card => @network_interface_card
    respond_with(@network_interface_card, @network_interfaces)
  end

  def show
    respond_with(@network_interface_card, @network_interface)
  end

  def new
    @network_interface = NetworkInterface.new :network_interface_card => @network_interface_card
    respond_with(@network_interface_card, @network_interface_)
  end

  def edit
  end

  def create
    @network_interface = NetworkInterface.new(network_interface_params)
    @network_interface.save
    respond_with(@device, @network_interface_card, @network_interface)
  end

  def update
    @network_interface.update(network_interface_params)
    respond_with(@device, @network_interface_card, @network_interface)
  end

  def destroy
    @network_interface.destroy
    respond_with(@device, @network_interface_card, @network_interface)
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

  def set_network_interface_card
    @network_interface_card = NetworkInterfaceCard.find(params[:network_interface_card_id])
  end

  def set_network_interface
    @network_interface = NetworkInterface.find(params[:id])
    add_breadcrumb :index, @network_interface.interface
  end

  def network_interface_params
    params.require(:network_interface).permit(:roomnumber, :interface, :ip, :subnet, :router,  :dns, :ip6, :router6, :prefix,  :domains, :mac,  :speed, :duplex, :dhcp, :vlan, :online, :network_interface_card_id)
  end

end

