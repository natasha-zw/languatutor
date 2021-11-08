class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :quanity
      t.references :student

      t.timestamps
    end
    add_foreign_key :orders, :users, column: :student_id, primary_key: :id
  end
end
