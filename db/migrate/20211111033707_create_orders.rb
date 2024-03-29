class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :quanity
      t.references :student, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
