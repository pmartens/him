class AttachmentsController < ApplicationController

  before_action :set_attachmentable
  before_action :set_breadcrumb_attachmentable
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    respond_with @attachmentable
  end

  def show
    respond_with @attachmentable, @attachment
  end

  def new
    @attachment = Attachment.new
    respond_with @attachmentable, @attachment
  end

  def edit
  end

  def create
    @attachment = Attachment.new attachment_params
    @attachment.save
    respond_with @attachmentable, @attachment
  end

  def update
    @attachment.update attachment_params
    respond_with @attachmentable, @attachment
  end

  def destroy
    @attachment.destroy
    respond_with @attachmentable, @attachment
  end

  private

  def set_attachmentable
    @attachmentable = nil
    params.each do |name, value|
      if name =~ /(.+)_id$/
         @attachmentable = $1.classify.constantize.find(value)
         break
      end
    end
  end

  def set_attachment
    @attachment = Attachment.find(params[:id])
    add_breadcrumb @attachment.document.name
  end

  def attachment_params
    params.require(:attachment).permit(:attachmentable_id, :attachmentable_type, :document_id,
    document_attributes:[:id, :name, :document, :_destroy])
  end

  def set_breadcrumb_attachmentable
    case @attachmentable.class.name
      when 'Invoice'
        add_breadcrumb @attachmentable.invoicenumber, :invoice_attachments_path
        add_breadcrumb :index_invoices, :invoices_path
      when 'Device'
        add_breadcrumb @attachmentable.name, :device_attachments_path
        add_breadcrumb :index_devices, :devices_path
    end
  end

end
