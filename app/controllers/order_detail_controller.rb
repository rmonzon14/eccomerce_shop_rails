class OrderDetailController < ApplicationController
  def index
    @order_details = OrderDetail.all
  end

  def show
    @ordered_products = Product.joins(:order_products).where(order_products: {order_detail_id: params[:id]})
  end
end
