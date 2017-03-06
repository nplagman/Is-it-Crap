class DropInstalls < ActiveRecord::Migration[5.0]
  def change
  	  def change
    drop_table :faves
    drop_table :picks
  end
  end
end
