class InvoicesController < ApplicationController

  add_breadcrumb :index, :invoices_path

  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @search = InvoiceSearch.new(params[:invoice_search] || {})
    @invoices = Kaminari.paginate_array(@search.search).page(params[:page])
    respond_with(@invoices, @search)
  rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
    @invoices = []
    @error = e.message.match(/QueryParsingException\[([^;]+)\]/).try(:[], 1)
    respond_with(@invoices)
  end

  def show
    respond_with(@invoice)
  end

  def new
    @invoice = Invoice.new
    respond_with(@invoice)
  end

  def edit
  end

  def create
    @invoice = Invoice.new invoice_params
    @invoice.save
    respond_with(@invoice)
  end

  def update
    @invoice.update invoice_params
    respond_with(@invoice)
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
  end

  private

  def set_invoice
    @invoice = Invoice.find params[:id]
    add_breadcrumb @invoice.invoicenumber
  end

  def invoice_params
    params.require(:invoice).permit(:invoicenumber, :invoicedate, :state, :user_id, :supplier_id, :created_at, :update_at, :invoice_type_id,
    documents_attributes:[:id, :name, :document, :_destroy])
  end

end
