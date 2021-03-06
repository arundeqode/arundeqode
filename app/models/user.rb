class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :first_name, :last_name, presence: true
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
end
