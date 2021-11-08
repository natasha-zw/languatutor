class User < ApplicationRecord
    has_many :user_subjects
    has_many :subjects, through: :user_subjects
    has_one :course, class_name: 'course', foreign_key: 'teacher_id'
    has_many :orders, class_name: 'order', foreign_key: 'student_id'
    has_many :courses, through: :course_users
end