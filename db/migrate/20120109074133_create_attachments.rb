class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :project_id
      t.string :scope
      t.string :name
      t.string :file_uid, :file_name
      t.timestamps
    end
  end
end
