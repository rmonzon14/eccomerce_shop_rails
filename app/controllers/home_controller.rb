class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @brands = Brand.all


  end
end
