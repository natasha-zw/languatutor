class Order < ApplicationRecord
  # validation
  validate :check_for_existing_order

  # relations
  belongs_to :student, class_name: 'User'
  has_many :course_orders, dependent: :destroy
  has_many :courses, through: :course_orders

  def check_for_existing_order
    uncompleted_orders = Order.where(student_id: student, complete: false)
    if uncompleted_orders.count > 0
      errors.add(:base, "You have an uncompleted order please check your shopping cart")
    end
  end 

  def course_order
    return CourseOrder.find_by(order_id: student.order.id)
  end 

 
end
