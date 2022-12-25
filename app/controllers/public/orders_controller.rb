class Public::OrdersController < ApplicationController
  def new
    @addresses = current_customer.addresses
    @order = Order.new
  end

  def confirm
    @orders = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @postage = 800
    @total_price = 0
    if params[:order][:select_address] == "1"
      @customer = current_customer
      @orders.postal_code = @customer.postal_code
      @orders.customer_name = @customer.last_name + @customer.first_name
      @orders.address = @customer.address
    elsif params[:order][:select_address] == "2"
      @address = Addresse.find(params[:order][:addresse_id])
      @orders.postal_code = @address.postal_code
      @orders.customer_name = @address.name
      @orders.address = @address.address
    elsif params[:order][:select_address] == "3"
    end
  end

  def completion
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_items|
      @order_items = OrderItem.new
      @order_items.order_id = @order.id
      @order_items.item_id = cart_items.item_id
      @order_items.purchase_price = cart_items.item.price
      @order_items.quantity = cart_items.amount
      @order_items.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_completion_path
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price = 0
    @postage = 800
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:address,:customer_name,:postal_code,:postage,:total_price,)
  end
end