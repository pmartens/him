class DocumentsController < ApplicationController

  add_breadcrumb :index, :documents_path

  before_action :set_document, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @documents = Document.all
    respond_with(@documents)
  end

  def show
    respond_with(@documents)
  end

  def new
    @document = Document.new
    respond_with(@document)
  end

  def edit
  end

  def create
    @document = Document.new document_params
    @document.save
    respond_with(@document)
  end

  def update
    @document.update(document_params)
    respond_with(@document)
  end

  def destroy
    @document.destroy
    respond_with(@document)
  end

  private

  def set_document
    @document = Document.find(params[:id])
    add_breadcrumb @document.name
  end

  def document_params
    params.require(:document).permit(:id, :name, :document, :created_at, :update_at)
  end

end
