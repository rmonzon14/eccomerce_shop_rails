class UserInfo < ApplicationRecord
  belongs_to :user
  belongs_to :province

  validates :first_name, :last_name, :phone_number, :postal_code, :city, presence: true
end
