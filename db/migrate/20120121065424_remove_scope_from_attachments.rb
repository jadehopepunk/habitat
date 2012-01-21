class RemoveScopeFromAttachments < ActiveRecord::Migration
  def up
    remove_column :attachments, :scope
  end

  def down
    ass_column :attachments, :scope, :string
  end
end
