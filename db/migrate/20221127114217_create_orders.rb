class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false#                 会員id
      t.integer :total_price, null: false#                 請求金額
      t.integer :postage, null: false#                     送料
      t.integer :payment_method, null: false, default: 0#  支払方法
      t.integer :order_status, null: false, default: 0#    注文ステータス
      t.string  :postal_code, null: false#                 郵便番号
      t.string  :address, null: false#                     住所
      t.string  :customer_name, null: false#               宛名

      t.timestamps
    end
  end
end
