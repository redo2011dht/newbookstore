ActiveAdmin.register Book do
	permit_params :title, :description, :publisher_id, :category_id, :price,  :author,:image

	scope :all, default: true
	
	#filter
	filter :category
	filter :publisher
	filter :title	
	filter :author
	filter :price



	##pagination
	 config.per_page = 3
	index do		
		column :title
		column :description
		column :author
		column :category
		column :publisher

		column "Image", sortable: :image do |book|
			link_to image_tag(book.image.url(:thumb)),admin_book_path(book)
		end

		column "Price", sortable: :price do |book|
			 number_to_currency(book.price, :unit => "Vnđ", :separator => ',', :delimiter => ".", :format => "%n %u",)	
		end

		actions
	end

	show do		
		image_tag book.image.url(:large) 		
		#number_to_currency book.price
		 attributes_table do
		     row :image do
		        image_tag book.image.url(:large) 		       
		      end
		     row :title    
		     row :description
		     row :author
		     row :category
		     row :publisher
		     row :price do
		     	number_to_currency(book.price, :unit => "Vnđ", :separator => ',', :delimiter => ".", :format => "%n %u",)
		     end
		  
		    end
		    active_admin_comments		
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
