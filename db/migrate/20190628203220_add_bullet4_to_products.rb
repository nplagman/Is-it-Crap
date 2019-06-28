class AddBullet4ToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bullet4, :text
  end
end
