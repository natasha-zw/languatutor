class CourseOrdersController < ApplicationController

  def update
    @order_item = @order.courses.find(params[:id])
  end

  def destroy
  end

  private 
  def set_order
    @order = current_user.order
  end

  def order_params 
    params.require(:course_order).permit(:course_id, :quantity)
  end 
end
