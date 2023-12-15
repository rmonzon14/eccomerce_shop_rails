class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :checkout_id
      t.decimal :grand_total
      t.decimal :HST
      t.decimal :PST
      t.decimal :GST
      t.references :user_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
