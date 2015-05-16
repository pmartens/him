class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
