class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :province_name
      t.decimal :PST
      t.decimal :HST
      t.decimal :GST

      t.timestamps
    end
  end
end
