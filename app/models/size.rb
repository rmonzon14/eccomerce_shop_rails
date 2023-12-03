class Size < ApplicationRecord
  has_many :products, through: :product_sizes
  has_many :product_sizes

  validates :size, presence: true
end
