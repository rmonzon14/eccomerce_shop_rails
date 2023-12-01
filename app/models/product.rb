class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :product_gender
  belongs_to :category
  has_many :sizes, through: :product_sizes

  validates :product_name, :resell_price, :retail_price, :color, presence: true
  validates :is_used, inclusion: { in: [ true, false ] }
  validates :resell_price, :retail_price, numericality: { greater_than_or_equal_to: 0.01 }
end
