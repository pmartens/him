class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :version
      t.date :purchased_at
      t.string :license
      t.text :properties

      t.timestamps
    end
  end
end
