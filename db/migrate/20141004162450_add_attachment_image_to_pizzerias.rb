class AddAttachmentImageToPizzerias < ActiveRecord::Migration
  def self.up
    change_table :pizzerias do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pizzerias, :image
  end
end
