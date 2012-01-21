class RenameAttachmentNameToTitle < ActiveRecord::Migration
  def change
    rename_column :attachments, :name, :title
  end
end
