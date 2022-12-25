class Public::AddressesController < ApplicationController
  def index
    @addresse = Addresse.new
    @addresses = current_customer.addresses
  end

  def edit
    @addresses = Addresse.find(params[:id])
  end

  def create
     @addresse = Addresse.new(addresse_params)
     @addresse.customer_id = current_customer.id
     @addresse.save
     flash[:notice] = "追加しました"
     redirect_to addresses_path
  end

  def update
    @addresses = Addresse.find(params[:id])
    @addresses.update(addresse_params)
    flash[:notice] = "更新しました"
    redirect_to addresses_path
  end

  def destroy
    @addresses = Addresse.find(params[:id])
    @addresses.destroy
    flash[:notice] = "削除しました"
    redirect_to addresses_path
  end

  private

  def addresse_params
    params.require(:addresse).permit(:name,:postal_code,:address)
  end
end
