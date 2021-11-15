class CourseOrdersController < ApplicationController
  def create
    @order_item = @order.courses.new(params[:id]) 

  end

  def update
  end

  def destroy
  end

  private 
  def set_order
    @order = current_user.order
  end
end
