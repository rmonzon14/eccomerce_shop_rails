class OrderDetail < ApplicationRecord
  belongs_to :user

  has_many :products, through: :order_products
  has_many :order_products
end
