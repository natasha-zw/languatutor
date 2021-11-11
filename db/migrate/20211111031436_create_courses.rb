class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :tutor, null: false, foreign_key: { to_table: :users }
      t.references :subject, null: false, foreign_key: true
      t.text :description, limit: 500
      t.integer :price

      t.timestamps
    end
  end
end
