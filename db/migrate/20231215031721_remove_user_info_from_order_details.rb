class RemoveUserInfoFromOrderDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :user_info_id, :integer
  end
end
