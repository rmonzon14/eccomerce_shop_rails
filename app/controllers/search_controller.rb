class SearchController < ApplicationController
  def index
    search_keyword = params[:q]
    search_categories = params[:category]

    @search_keyword_instance = search_keyword
    @search_category_instance = params[:category]



    if search_keyword.present?
      if search_categories  == "All" &&
        @found_products = Product.joins(:category).where("products.product_name LIKE ?", "%#{search_keyword}%")
      else
        @found_products = Product.joins(:category).where("products.product_name LIKE ? AND categories.category_name = ?", "%#{search_keyword}%", search_categories)
      end
    else
      @found_products = []
    end
  end
end
