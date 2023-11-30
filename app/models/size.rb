class Size < ApplicationRecord
  has_many :product_sizes

  validates :size, presence: true
end
