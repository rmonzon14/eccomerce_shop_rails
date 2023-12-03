class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # Allow access to admin users
  def self.ransackable_attributes(auth_object = nil)
    super & ['email', 'username']
  end
end
