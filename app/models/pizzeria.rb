class Pizzeria < ActiveRecord::Base
	searchkick
	belongs_to :user
	has_many :reviews

  has_attached_file :image, styles: { medium: "400x400#", :small => "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
