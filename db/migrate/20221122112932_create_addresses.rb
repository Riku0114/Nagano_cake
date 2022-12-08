class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      t.references :customer, null: false, foreign_key: true#  会員id
      t.string     :name, null: false#                         宛名
      t.string     :postal_code, null: false#                  郵便番号
      t.string     :address, null: false#                      住所

      t.timestamps
    end
  end
end
