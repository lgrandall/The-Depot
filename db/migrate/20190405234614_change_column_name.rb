class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :line_items, :products_id, :product_id 
  end
end
