class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :product_gender
  belongs_to :category
  has_many :sizes, through: :product_sizes
  has_many :product_sizes
  has_many :order_details, through: :order_products
  has_many :order_products

  # Set up image mapping
  has_one_attached :image

  validates :product_name, :resell_price, :retail_price, :color, presence: true
  validates :is_used, inclusion: { in: [ true, false ] }
  validates :resell_price, :retail_price, numericality: { greater_than_or_equal_to: 0.01 }

  def to_builder
    Jbuilder.new do |product|
      product.resell_price stripe_price_id
      product.quantity 1
    end
  end

end
