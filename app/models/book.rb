class Book < ActiveRecord::Base
	
	validates :category_id, :publisher_id, :title,:price, presence: true

	belongs_to :publisher
	belongs_to :category

	has_attached_file :image, styles: { large: "400x600>", medium: "200x300>", thumb: "40x60>" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
