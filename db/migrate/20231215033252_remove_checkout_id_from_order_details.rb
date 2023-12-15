class RemoveCheckoutIdFromOrderDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :checkout_id, :integer
  end
end
