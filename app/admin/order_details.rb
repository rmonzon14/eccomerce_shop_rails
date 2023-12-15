ActiveAdmin.register OrderDetail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :grand_total, :HST, :PST, :GST, :user_id, :order_date, :checkout_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:grand_total, :HST, :PST, :GST, :user_id, :order_date, :checkout_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
