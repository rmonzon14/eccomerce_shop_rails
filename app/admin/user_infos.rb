ActiveAdmin.register UserInfo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :street, :postal_code, :city, :phone_number, :user_id, :province_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :street, :postal_code, :city, :phone_number, :user_id, :province_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
