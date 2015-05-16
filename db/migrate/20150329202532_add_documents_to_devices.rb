class AddDocumentsToDevices < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.timestamps
    end
    add_attachment :documents, :document
    add_belongs_to :documents, :device
  end

  def self.down
    drop_table :documents
  end
end


