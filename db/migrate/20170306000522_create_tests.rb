class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.text :description
      t.string :youtube
      t.string :buyling
      t.string :image

      t.timestamps
    end
  end
end
