class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      
      t.integer :order_id, null: false#                      注文id
      t.integer :item_id, null: false#                       商品id
      t.integer :quantity, null: false#                      数量
      t.integer :purchase_price, null: false#                購入時金額
      t.integer :production_status, null: false, default: 0# 製作ステータス

      t.timestamps
    end
  end
end
