class Product < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: [:finders]

	belongs_to :category
	belongs_to :user
	mount_uploader :image, ImageUploader

	# validates :meta_title, presence: true, length: { maximum: 60 }


	def self.search(term)
		if term
			where('name ILIKE ?', "%#{term}%").order('id DESC')
		else
			all
		end
	end
	
end
