class CartController < ApplicationController
  def index
    @cart_items = session[:cart] || []
  end

  def show

  end

  def create
    size_id = params[:size_id].to_i
    session[:cart] << size_id unless session[:cart].include?(size_id)
    redirect_to root_path
  end

  def destroy
    size_id = params[:id].to_i
    session[:cart].delete(size_id)
    redirect_to cart_index_path
  end

end
