class RenameAndChangeTypeInUserInfo < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_infos, :phone_numberinteger, :phone_number

    change_column :user_infos, :phone_number, :integer
  end
end
