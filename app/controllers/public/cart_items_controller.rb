class Public::CartItemsController < ApplicationController
   before_action :signed, only: [:create]

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def update
     @cart_items = CartItem.find(params[:id])
     @cart_items.update(cart_item_params)
     flash[:notice] = "更新しました"
    redirect_to cart_items_path
  end

  def destroy
     @cart_items = CartItem.find(params[:id])
     @cart_items.destroy
     flash[:notice] = "削除しました"
    redirect_to cart_items_path
  end

   def erase
    current_customer.cart_items.destroy_all
    flash[:notice] = "削除しました"
    redirect_to cart_items_path
   end


  def create
      @cart_items = CartItem.new(cart_item_params)
      @cart_items.customer_id = current_customer.id
      if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.save
        flash[:notice] = "カートに追加しました"
        redirect_to cart_items_path
      else
      @cart_items.save
      flash[:notice] = "カートに追加しました"
      redirect_to cart_items_path
      end
  end

   private

   def signed
    if customer_signed_in?
    else
      flash[:notice] = "ログイン後に購入いただけます"
      redirect_to root_path
    end
   end

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end