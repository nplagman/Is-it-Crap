class ChangeBuylingToBuylink < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tests, :buyling, :buylink
  end
end
