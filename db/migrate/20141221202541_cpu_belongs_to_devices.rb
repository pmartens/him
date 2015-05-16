class CpuBelongsToDevices < ActiveRecord::Migration
  def change
    add_belongs_to :devices, :cpu
  end
end
