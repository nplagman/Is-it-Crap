class AddBullet1ToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bullet1, :text
  end
end
