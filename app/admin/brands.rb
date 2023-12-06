ActiveAdmin.register Brand do
  permit_params :brand_name, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size:"150x150"): ""
    end
    f.actions
  end
end
