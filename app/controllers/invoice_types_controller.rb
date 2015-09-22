class InvoiceTypesController < ApplicationController

  #add_breadcrumb :index, :invoice_types_path

  before_action :set_invoice_type, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @invoice_types = InvoiceType.all
    respond_with(@invoice_types)
  end

  def new
    @invoice_type = InvoiceType.new
    respond_with(@invoice_type)
  end

  def edit
  end

  def create
    @invoice_type = InvoiceType.new(invoice_type_params)
    @invoice_type.save
    redirect_to action: 'index'
  end

  def update
    @invoice_type.update(invoice_type_params)
    respond_with(@invoice_type)
  end

  def destroy
    @invoice_type.destroy
    respond_with(@invoice_type)
  end

  private

  def set_invoice_type
    @invoice_type = InvoiceType.find(params[:id])
    #add_breadcrumb @invoice_type.name
  end

  def invoice_type_params
    params.require(:invoice_type).permit(:name, :created_at, :update_at)
  end
end
