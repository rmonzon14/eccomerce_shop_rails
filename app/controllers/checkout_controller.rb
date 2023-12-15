class CheckoutController < ApplicationController
  helper_method :current_user

  def create
    cart_items = session[:cart]

    products_collection ||= []

    cart_items.each do |item|
      products_collection << ProductSize.joins(:product, :size).find(item).product
    end

    @province = Province.joins(:user_infos).where(user_infos: { user_id: current_user.id }).first

    subtotal = 0
    products_collection.each do |pc|
      subtotal += pc.resell_price
    end

    product_li_format = products_collection.map do |p|
      {
        :price_data =>{ :currency => "cad",
        :product_data => {:name => p.product_name},
        :unit_amount => (p.resell_price * 100).to_i },
        :quantity => 1
      }
    end

    product_li_format<< {
      :price_data =>{ :currency => "cad",
      :product_data => {:name => "Total Taxes", :description => "GST(#{@province.GST}) + HST(#{@province.HST})  + PST(#{@province.PST}) "},
      :unit_amount => ((@province.HST * subtotal) * 100).to_i },
      :quantity => 1
    }

    puts product_li_format.inspect

    session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      line_items: [product_li_format.as_json],
      mode: 'payment',
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
    })

    redirect_to session.url, allow_other_host: true
  end

  def success



    redirect_to cart_index_path
  end

  def cancel
    redirect_to cart_index_path
  end

end
