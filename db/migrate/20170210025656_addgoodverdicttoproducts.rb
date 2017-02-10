class Addgoodverdicttoproducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :goodverdict, :string
  end
end
