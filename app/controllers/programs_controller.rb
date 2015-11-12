class ProgramsController < ApplicationController

  add_breadcrumb :index, :programs_path

  before_action :set_program, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @programs = Program.all
    respond_with(@programs)
  end

  def show
    respond_with(@program)
  end

  def new
    @program = Program.new
    respond_with(@program)
  end

  def edit
  end

  def create
    @program = Program.new(program_params)
    @program.save
    respond_with(@program)
  end

  def update
    @program.update(program_params)
    respond_with(@program)
  end

  def destroy
    @program.destroy
    respond_with(@program)
  end

  private

  def set_program
    @program = Program.find(params[:id])
    add_breadcrumb @program.title
  end

  def program_params
    params.require(:program).permit(:title, :version, :os, :purchased_at, :license, :properties, :created_at, :update_at)
  end
end
