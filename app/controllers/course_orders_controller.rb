class CourseOrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy buy]

  def update
    @order_item = @order.course_orders.find(params[:course_id])
    @order_item.update!(quantity: params[:quantity])
  end

  def destroy; end

  private

  def set_order
    @order = current_user.order
  end

  def order_params
    params.require(:course_order).permit(:course_id, :quantity)
  end
end
