class CheckoutController < ApplicationController
  helper_method :current_user

  def create
    cart_items = session[:cart]

    products_collection ||= []

    cart_items.each do |item|
      products_collection << ProductSize.joins(:product, :size).find(item).product
    end

    province = Province.joins(:user_infos).where(user_infos: { user_id: current_user.id }).first

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
      :product_data => {:name => "Total Taxes", :description => "GST(#{province.GST}) + HST(#{province.HST})  + PST(#{province.PST}) "},
      :unit_amount => ((calculate_total_tax(province.PST, province.GST, province.HST, subtotal)) * 100).to_i },
      :quantity => 1
    }

    puts product_li_format.inspect

    session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      line_items: [product_li_format.as_json],
      mode: 'payment',
      shipping_address_collection: {
      allowed_countries: ['CA'],
      },
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
    })

    redirect_to session.url, allow_other_host: true
  end

  def success
    session_id = params[:session_id]

    cart_items = session[:cart]

    products_collection ||= []

    cart_items.each do |item|
      products_collection << ProductSize.joins(:product, :size).find(item).product
    end

    province = Province.joins(:user_infos).where(user_infos: { user_id: current_user.id }).first

    subtotal = 0
    products_collection.each do |pc|
      subtotal += pc.resell_price
    end

    grand_total = calculate_total_tax(province.PST, province.GST, province.HST, subtotal) + subtotal

    order_detail = OrderDetail.create(
      checkout_id: session_id,
      grand_total: grand_total,
      order_date: Date.today,
      HST: province.HST,
      PST: province.PST,
      GST: province.GST,
      user_id: current_user.id
    )

    products_collection.each do |p|
      order_product = OrderProduct.create(
        order_detail_id: OrderDetail.find_by(checkout_id: session_id.to_i).id,
        product_id: p.id
      )
    end

    session[:cart] = []

    redirect_to cart_index_path
  end

  def cancel

    redirect_to cart_index_path
  end

  def calculate_total_tax(pst, gst, hst, subtotal)
    pst = (subtotal + gst) * pst

    hst = (subtotal + gst) * hst

    gst = subtotal * gst

    total = gst + pst + hst

    total
  end

end
