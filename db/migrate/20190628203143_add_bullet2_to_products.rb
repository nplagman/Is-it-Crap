class AddBullet2ToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bullet2, :text
  end
end
