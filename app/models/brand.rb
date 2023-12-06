class Brand < ApplicationRecord
  has_many :products

  # Set up image mapping
  has_one_attached :image
end
