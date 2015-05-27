class DevicesController < ApplicationController

  add_breadcrumb :index, :devices_path

  before_action :set_device, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @grid = DeviceGrid.new(params[:device_grid])
    respond_to do |f|
      f.html do
        @grid.scope {|scope| scope.page(params[:page]).per(21) }
      end
      f.csv do
        send_data @grid.to_csv,
                  type: "text/csv",
                  disposition: 'inline',
                  filename: "devices-#{Time.now.to_s}.csv"
      end
      f.pdf do
        render pdf: "devices-#{Time.now.to_s}.pdf",
               orientation: "Landscape",
               disposition: "attachment"
      end
    end
  end

  def show
    respond_with(@device)
  end

  def new
    @device = Device.new
    respond_with(@device)
  end

  def edit
  end

  def create
    @device = Device.new(device_params)
    @device.save
    respond_with(@device)
  end

  def update
    @device.update(device_params)
    respond_with(@device)
  end

  def destroy
    @device.destroy
    respond_with(@device)
  end

  private

    def set_device
      @device = Device.find(params[:id])
      add_breadcrumb @device.name
    end

    def device_params
      params.require(:device).permit(:name, :device_type_id, :manufacturer_id, :model_name, :serialnumber, :servicetag, :purchased_at, :color, :number_of_cpu, :cpu_id, :number_of_mem, :memory_module_id, :features, :information, :created_at, :update_at, :user_id, :document, :program_ids => [])
    end

end
