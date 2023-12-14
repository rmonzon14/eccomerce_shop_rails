class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
    @sizes = ProductSize.joins(:size).where(product: @product).select("sizes.size as available_size, product_sizes.id as id")
  end
end
