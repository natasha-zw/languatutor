# CourseOrders is the shopping cart 
class CourseOrdersController < ApplicationController
  before_action :set_order, only: %i[update destroy]
  before_action :set_order_item, only: %i[ update destroy ]

  # PATCH/PUT /course_orders/update update the quantity of an item in the shopping cart
  def update
    @order_item.update!(quantity: params[:quantity])
  end

  # DELETE /course_order/1/destroy remove an item from the shopping cart redirects back to shopping cart with message 
  def destroy
    @order_item.delete
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: 'Order item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Order of the current user
  def set_order
    @order = current_user.order
  end

  # Item inside the shopping cart
  def set_order_item 
    @order_item = @order.course_orders.find_by(course_id: params[:course_id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:course_order).permit(:course_id, :quantity, :order_id)
  end
end
