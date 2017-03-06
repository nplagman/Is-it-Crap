class CreateNickspicks < ActiveRecord::Migration[5.0]
  def change
    create_table :nickspicks do |t|
      t.string :name
      t.text :description
      t.string :buylink
      t.string :youtube
      t.string :image

      t.timestamps
    end
  end
end
