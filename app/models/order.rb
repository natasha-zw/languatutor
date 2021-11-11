class Order < ApplicationRecord
  belongs_to :student, class_name: 'User'
  has_many :course_orders
  has_many :courses, through: :course_orders
end
