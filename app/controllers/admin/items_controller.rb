class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:index,:show,:edit,:new]
  
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def new
    @item = Item
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    flash[:notice] = "登録しました"
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash[:notice] = "更新しました"
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end
end
