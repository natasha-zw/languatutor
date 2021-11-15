class AddQuantityToCourseOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :course_orders, :quantity, :integer, default: 1
  end
end
