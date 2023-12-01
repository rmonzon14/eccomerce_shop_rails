class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @sizes = ProductSize.joins(:size, :product).where(product: {id: params[:id]}).select("sizes.size as available_size")
  end
end
