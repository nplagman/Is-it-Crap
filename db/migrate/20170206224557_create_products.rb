class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :brief
      t.text :description
      t.string :buylink
      t.string :verdict
      t.string :category_id

      t.timestamps
    end
  end
end
