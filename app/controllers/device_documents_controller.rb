class DeviceDocumentsController < DocumentsController

  add_breadcrumb :index_devices, :devices_path
  add_breadcrumb :index, :device_documents_path

  before_action :set_device

  def index
    @documents = Document.where device: @device unless @device.nil?
    respond_with(@device, @documents)
  end

  def show
    respond_with(@device, @document)
  end

  def new
    @document= Document.new device: @device
    respond_with(@device, @document)
  end

  def create
    @document = Document.new document_params
    @document.save
    respond_with(@device, @document)
  end

  def update
    @document.update document_params
    respond_with(@device, @document)
  end

  def destroy
    @document.destroy
    respond_with(@device, @document)
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

  def set_document
    super
    add_breadcrumb @document.name
  end

  def document_params
    params.require(:document).permit(:name, :document, :device_id)
  end

end
