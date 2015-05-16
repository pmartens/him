class CreateMemorymodules < ActiveRecord::Migration
  def change
    create_table :memory_modules do |t|
      t.string :brand
      t.string :model
      t.string :modeltype
      t.integer :capacity
      t.integer :modules
      t.string :buildform
      t.string :speed
      t.text :information

      t.timestamps
    end
    add_belongs_to :devices, :memory_module
  end
end
