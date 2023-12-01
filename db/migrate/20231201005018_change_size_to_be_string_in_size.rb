class ChangeSizeToBeStringInSize < ActiveRecord::Migration[7.0]
  def change
    change_column :sizes, :size, :string
  end
end
