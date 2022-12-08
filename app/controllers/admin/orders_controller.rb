class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(paramms[:id])
  end

  def update
  end
end
