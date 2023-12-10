class Province < ApplicationRecord
  has_many :user_infos

  validates :province_name, presence: true
end
