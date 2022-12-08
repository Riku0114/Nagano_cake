class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      
      t.string :name, null: false# 名前

      t.timestamps
    end
  end
end
