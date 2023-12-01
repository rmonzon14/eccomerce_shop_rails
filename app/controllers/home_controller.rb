class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @brands = Brand.limit(5)
  end
end
