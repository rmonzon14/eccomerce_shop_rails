class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :resell_price
      t.decimal :retail_price
      t.text :description
      t.date :released_date
      t.boolean :is_used
      t.string :color
      t.string :image_path
      t.references :brand, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
