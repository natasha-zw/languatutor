class CourseUser < ApplicationRecord
    belongs_to :student, class_name: "User", foreign_key: "student_id"
    belongs_to :course, class_name: "course", foreign_key: "course_id"
end
