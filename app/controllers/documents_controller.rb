class DocumentsController < ApplicationController

  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  respond_to :html

  def index
    if @type.present?
      @documents = Document.where @type.keys.first => @type.values.first
      respond_with(@type, @documents)
    else
      @documents = Document.all
      respond_with(@documents)
    end
  end

  def show
    @type.present? ? respond_with(@type, @documents) : respond_with(@document)
  end

  def new
    if @type.present?
      @document= Document.new @type.keys.first => @type.values.first
      respond_with(@type, @documents)
    else
      @document= Document.new
      espond_with(@document)
    end
  end

  def edit
  end

  def create
    @document = Document.new document_params
    @document.save
    @type.present? ? respond_with(@type, @documents) : respond_with(@document)
  end

  def update
    @document.update document_params
    @type.present? ? respond_with(@type, @documents) : respond_with(@document)
  end

  def destroy
    @document.destroy
    @type.present? ? respond_with(@type, @documents) : respond_with(@document)
  end

  private

  def respond
    @type.present? ? respond_with(@type, @documents) : respond_with(@document)
  end

  def set_type
    if params[:device_id].present?
      @type = { device: Device.find(params[:device_id]) }
    elsif params[:invoice_id]
      @type = { invoice: Invoice.find(params[:invoice_id]) }
    end
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :document, :device_id, :invoice_id)
  end

end
