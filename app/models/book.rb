class Book < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :category
end
