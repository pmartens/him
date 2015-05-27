class CpusController < ApplicationController

  add_breadcrumb :index_devices, :devices_path
  add_breadcrumb :index, :cpus_path

  before_action :set_cpu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cpus = Cpu.all
    respond_with(@cpus)
  end

  def show
    respond_with(@cpu)
  end

  def new
    @cpu = Cpu.new
    respond_with(@cpu)
  end

  def edit
  end

  def create
    @cpu = Cpu.new(cpu_params)
    @cpu.save
    respond_with(@cpu)
  end

  def update
    @cpu.update(cpu_params)
    respond_with(@cpu)
  end

  def destroy
    @cpu.destroy
    respond_with(@cpu)
  end

  private

  def set_cpu
    @cpu = Cpu.find(params[:id])
    add_breadcrumb @cpu.brand
  end

  def cpu_params
    params.require(:cpu).permit(:brand, :processor_number, :instruction_set, :cores, :threads, :frequency, :socket_type, :created_at, :update_at)
  end
end
