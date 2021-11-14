class Order < ApplicationRecord
  # validation
  # validates :quanity, presence: {message: 'Please provide the quantity'}
  validate :check_for_exiting_order

  # relations
  belongs_to :student, class_name: 'User'
  has_many :course_orders, dependent: :destroy
  has_many :courses, through: :course_orders

  def check_for_exiting_order

    uncompleted_orders = Order.where(student_id: student, complete: false)
    if uncompleted_orders.count > 0
      errors.add(:base, "You have an uncompleted order please check your shopping cart")
    end
  end 
end
