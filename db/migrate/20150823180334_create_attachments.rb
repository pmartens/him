class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :documents, index: true
      t.references :attachmentable, polymorphic: true, index: true
      t.timestamps null: false
    end
    remove_column :documents, :invoice_id
    remove_column :documents, :device_id

  end
end
