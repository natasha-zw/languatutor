class Order < ApplicationRecord
  # validation
  validates :quanity, presence: {message: 'Please provide the quantity'}

  # relations
  belongs_to :student, class_name: 'User'
  has_many :course_orders
  has_many :courses, through: :course_orders
end
