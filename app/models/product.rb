class Product < ApplicationRecord
	belongs_to :category
	belongs_to :user
	mount_uploader :image, ImageUploader

	
end
