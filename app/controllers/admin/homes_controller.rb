class Admin::HomesController < ApplicationController
  def top
    @admin = current_admin
    @orders = Order.all
  end
end
