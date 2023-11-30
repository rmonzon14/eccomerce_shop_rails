class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :product_gender
  belongs_to :category
  has_many :product_sizes

  validates :product_name, :resell_price, :retail_price, :is_used, :color, presence: true
  validates :resell_price, :retail_price, numericality: { greater_than_or_equal_to: 0.01 }
end
