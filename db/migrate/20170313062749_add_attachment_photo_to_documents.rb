class AddAttachmentPhotoToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :documents, :photo
  end
end
