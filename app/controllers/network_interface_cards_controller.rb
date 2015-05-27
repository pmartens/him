class NetworkInterfaceCardsController < ApplicationController

  add_breadcrumb :index_devices, :devices_path
  add_breadcrumb :index, :device_network_interface_cards_path

  before_action :set_device
  before_action :set_network_interface_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @network_interface_cards = NetworkInterfaceCard.where :device => @device
    respond_with(@device, @network_interface_cards)
  end

  def show
    respond_with(@device, @network_interface_card)
  end

  def new
    @network_interface_card = NetworkInterfaceCard.new(:device => @device )
    respond_with(@device, @network_interface_card)
  end

  def edit
  end

  def create
    @network_interface_card = NetworkInterfaceCard.new(network_interface_card_params)
    @network_interface_card.save
    respond_with(@device, @network_interface_card)
  end

  def update
    @network_interface_card.update(network_interface_card_params)
    respond_with(@device, @network_interface_card)
  end

  def destroy
    @network_interface_card.destroy
    respond_with(@device, @network_interface_card)
  end

  private

  def set_device
    @device = Device.find(params[:device_id])

  end

  def set_network_interface_card
    @network_interface_card = NetworkInterfaceCard.find(params[:id])
    add_breadcrumb @network_interface_card.brand
  end

  def network_interface_card_params
    params.require(:network_interface_card).permit(:brand, :device_type, :chipset, :transfer_rate, :interface, :device_id)
  end

end

