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
    @cart_items = current_customer.cart_items
    @order.total_price = params[:order][:total_price]
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_completion_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:address,:customer_name,:postal_code,:postage,:total_price,)
  end
end