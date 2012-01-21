class AddTargetToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :target_id, :integer
    add_column :attachments, :target_type, :string
  end
end
