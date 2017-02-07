class Product < ApplicationRecord
	belongs_to :category

	mount_uploaders :images, ImageUploader #mount the uploaders
end
