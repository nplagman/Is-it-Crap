class Product < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: [:finders]

	belongs_to :category
	belongs_to :user
	
	mount_uploader :image, ImageUploader



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
