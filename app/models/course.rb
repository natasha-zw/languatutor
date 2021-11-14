class Course < ApplicationRecord
  # validation
  validates :name, presence: true
  validates :description, presence: { messsage: 'Please add a description of the course' }
  validates :price, presence: { messsage: 'Please add the price of the course' }

  # relations
  belongs_to :tutor, class_name: 'User'
  belongs_to :subject
  has_many :user_courses, dependent: :destroy
  has_many :students, through: :user_courses, source: :user
  has_many :course_orders, dependent: :destroy
  has_many :orders, through: :course_orders
end
