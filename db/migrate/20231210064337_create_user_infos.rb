class CreateUserInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :phone_numberinteger
      t.references :user, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
