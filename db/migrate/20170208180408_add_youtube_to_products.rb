class AddYoutubeToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :youtube, :string
  end
end
