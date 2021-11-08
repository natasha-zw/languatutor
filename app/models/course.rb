class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  belongs_to :subjects
  has_many :students, through: :courses_users
  has_many :orders, through: :courses_orders
end
