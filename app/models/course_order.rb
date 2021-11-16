class CourseOrder < ApplicationRecord
  belongs_to :course
  belongs_to :order
  before_save :set_total

  def price
    if persisted?
      self.course.price
    else
      course.price
    end
  end 

  def total
    return price * self.quantity
  end  
 
end
