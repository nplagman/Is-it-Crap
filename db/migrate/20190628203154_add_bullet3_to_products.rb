class AddBullet3ToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bullet3, :text
  end
end
