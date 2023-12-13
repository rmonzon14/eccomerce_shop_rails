class ChangeTypeInUserInfo < ActiveRecord::Migration[7.0]
  def change
    change_column :user_infos, :phone_number, :string
  end
end
