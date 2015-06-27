ActiveAdmin.register Book do
	permit_params :title, :description, :publisher_id, :category_id, :price,  :author,:image

	scope :all, default: true



	index do
		column "Select" do |book|
			check_box("puppy", "commands", {:multiple => true}, "sit", nil)
		end

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

		column "Edit" do |book|
			link_to "Edit", edit_admin_book_path(book)			
		end
	end

	
	form do |f|
		f.inputs "BookDetails" do
			f.input :category
			f.input :publisher
			f.input :title
			f.input :description
			f.input :author
			f.input :price
			f.input :image
			f.submit
		end
	end




end
