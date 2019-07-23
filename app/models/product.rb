class Product < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: [:finders]

	belongs_to :category, optional: true
	belongs_to :user, optional: true
	has_many_attached :images
	has_one_attached :main_picture
	# mount_uploader :image, ImageUploader

	# def thumbnail input
	#   return self.main_picture[input].variant(resize: '300x300').processed
	# end

	# def self.search(search)
	# 	where("name ILIKE ?", "%#{search}%")
	# 	where("brief ILIKE ?", "%#{search}%")
	# 	where("description ILIKE ?", "%#{search}%")
	# 	where("verdict ILIKE ?", "%#{search}%")
	# 	where("category_id ILIKE ?", "%#{search}%")
	# end

	def self.search(term)
		if term
			where('name ILIKE ?', "%#{term}%").order('id DESC')
		else
			all
		end
	end
	
end
