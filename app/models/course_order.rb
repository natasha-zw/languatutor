class CourseOrder < ApplicationRecord
  belongs_to :course
  belongs_to :order


  def price
    if persisted?
      self.course.price
    else
      course.price
    end
  end 

  def total
    return price * quantity
  end  
end
