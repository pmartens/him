class CreateCpus < ActiveRecord::Migration
  def change
    create_table :cpus do |t|
      t.string :brand
      t.string :processor_number
      t.string :instruction_set
      t.integer :cores
      t.integer :threads
      t.float :frequency
      t.string :socket_type

      t.timestamps
    end
  end
end
