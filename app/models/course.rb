class Course < ApplicationRecord
  belongs_to :tutor, class_name: 'User'
  belongs_to :subject
  has_many :user_courses
  has_many :students, through: :user_courses, source: :user
  has_many :course_orders
  has_many :orders, through: :course_orders
end
