class ProductGender < ApplicationRecord
  has_many :products

  validates :product_gender, presence: true
end
