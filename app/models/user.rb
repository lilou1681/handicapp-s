class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :childrens, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :address, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
