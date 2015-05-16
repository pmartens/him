class DevicesHaveAndBelongToManyPrograms < ActiveRecord::Migration
  def change
    create_join_table :devices, :programs do |t|
      t.index :device_id
      t.index :program_id
    end
  end
end