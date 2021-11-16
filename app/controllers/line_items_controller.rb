class LineItemsController < ApplicationController
  def create
  end

  def update
  end

  def destroy
  end

  private 
  def line_items_params
    params.require(:line_order).permit(:quanity)
  end
end
