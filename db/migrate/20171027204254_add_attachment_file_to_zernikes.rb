class AddAttachmentFileToZernikes < ActiveRecord::Migration
  def self.up
    change_table :zernikes do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :zernikes, :file
  end
end
