class ProductSize < ApplicationRecord
  belongs_to :product
  belongs_to :size

  validates :brand_name, presence: true
end
