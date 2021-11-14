class RemoveQuanityFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :quanity, :integer
  end
end
