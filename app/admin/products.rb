ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_name, :resell_price, :retail_price, :description, :released_date, :is_used, :color, :image_path, :brand_id, :product_gender_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_name, :resell_price, :retail_price, :description, :released_date, :is_used, :color, :image_path, :brand_id, :product_gender_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
