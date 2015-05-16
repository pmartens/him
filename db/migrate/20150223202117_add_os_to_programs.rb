class AddOsToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :os, :boolean
  end
end
