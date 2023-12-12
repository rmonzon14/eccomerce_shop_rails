class AddTypeToProvince < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :type, :string
  end
end
