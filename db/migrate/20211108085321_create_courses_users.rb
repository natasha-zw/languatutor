class CreateCourseUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_users do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student

      t.timestamps
    end
    add_foreign_key :courses_users, :users, column: :student_id, primary_key: :id
  end
end
