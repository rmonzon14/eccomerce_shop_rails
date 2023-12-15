class AddCheckoutIdToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :checkout_id, :integer
  end
end
