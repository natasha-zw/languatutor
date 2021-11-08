class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :teacher
      t.references :subject, null: false, foreign_key: true
      t.text :description, limit: 500
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
    add_foreign_key :courses, :users, column: :teacher_id, primary_key: :id
  end
end
