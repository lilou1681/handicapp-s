class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :childrens, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
