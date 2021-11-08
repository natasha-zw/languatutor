class CreateCourseOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_orders do |t|
      t.references :course, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
