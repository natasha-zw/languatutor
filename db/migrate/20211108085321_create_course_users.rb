class CreateCourseUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :course_users do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student

      t.timestamps
    end
    add_foreign_key :course_users, :users, column: :student_id, primary_key: :id
  end
end
