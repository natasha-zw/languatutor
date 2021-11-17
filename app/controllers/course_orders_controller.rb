class CourseOrdersController < ApplicationController
  before_action :set_order, only: %i[update destroy]
  before_action :set_order_item, only: %i[ update destroy ]

  def update
    
    @order_item.update!(quantity: params[:quantity])
  end

  def destroy
    @order_item.delete
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order item was successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = current_user.order
  end

  def set_order_item 
    @order_item = @order.course_orders.find_by(course_id: params[:course_id])
  end

  def order_params
    params.require(:course_order).permit(:course_id, :quantity, :order_id)
  end
end
