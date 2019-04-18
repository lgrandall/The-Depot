class DropOrders < ActiveRecord::Migration[5.0]
  def change
  	drop_table :orders, force: :cascade
  end
end
