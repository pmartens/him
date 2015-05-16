class MemoryModulesController < ApplicationController

  before_action :set_memory_module, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @memory_modules = MemoryModule.all
    respond_with(@memory_modules)
  end

  def show
    respond_with(@memory_module)
  end

  def new
    @memory_module = MemoryModule.new
    respond_with(@memory_module)
  end

  def edit
  end

  def create
    @memory_module = MemoryModule.new(memory_module_params)
    @memory_module.save
    respond_with(@memory_module)
  end

  def update
    @memory_module.update(memory_module_params)
    respond_with(@memory_module)
  end

  def destroy
    @memory_module.destroy
    respond_with(@memory_module)
  end

  private

  def set_memory_module
    @memory_module = MemoryModule.find(params[:id])
  end

  def memory_module_params
    params.require(:memory_module).permit(:brand, :model, :modeltype, :capacity, :modules, :buildform, :speed, :information)
  end

end
