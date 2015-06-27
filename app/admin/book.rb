ActiveAdmin.register Book do
	permit_params :title, :description, :publisher_id, :category_id, :price,  :author,:image

	scope :all, default: true


	
	index do
		column :title
		column :description
		column :author
		column :category
		column :publisher
		
		column "Image", sortable: :image do |book|
			image_tag book.image.url(:thumb)
		end
		
		column "Price", sortable: :price do |book|
			number_to_currency book.price
		end
		
	end




end
