class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    @order_items = @order.order_items.all

    is_updated = true
    if @order_item.update(order_item_params)
         @order.update(order_status: 2) if @order_item.production_status == "production"
         @order_items.each do |order_item|
      if order_item.production_status != "completion"
         is_updated = false
      end
    end
      @order.update(order_status: 3) if is_updated
    end
    flash[:notice] = "更新しました"
    redirect_to admin_order_path(@order_item.order_id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
