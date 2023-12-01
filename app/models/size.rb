class Size < ApplicationRecord
  has_many :products, through: :product_sizes

  validates :size, presence: true
end
