class RenameTypeToTaxType < ActiveRecord::Migration[7.0]
  def change
    rename_column :provinces, :type, :tax_type
  end
end
