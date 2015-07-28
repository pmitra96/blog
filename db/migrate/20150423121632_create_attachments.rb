class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.string :add_attach_paperclip

      t.timestamps null: false
    end
    add_attachment :attachments, :document
  end
end
