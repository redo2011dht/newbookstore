ActiveAdmin.register Book do
	permit_params :title, :description, :publisher_id, :category_id, :price,  :author
end
