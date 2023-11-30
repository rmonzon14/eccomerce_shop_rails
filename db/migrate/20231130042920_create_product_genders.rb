class CreateProductGenders < ActiveRecord::Migration[7.0]
  def change
    create_table :product_genders do |t|
      t.string :product_gender

      t.timestamps
    end
  end
end
