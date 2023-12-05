ActiveAdmin.register Product do

  permit_params :product_name, :resell_price, :retail_price, :description, :released_date, :is_used, :color, :image_path, :brand_id, :product_gender_id, :category_id, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size:"150x150"): ""
    end
    f.actions
  end

end
