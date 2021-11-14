class AddCompletedToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :complete, :boolean, default: false
  end
end
