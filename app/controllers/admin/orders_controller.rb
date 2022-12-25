class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:show]

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price = 0
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    if @order.update(order_params)
    @order_items.update_all(production_status: 1) if @order.order_status == "payment"
    flash[:notice] = "更新しました"
    redirect_to admin_order_path(@order.id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
