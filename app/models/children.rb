class Children < ApplicationRecord
  belongs_to :user
  has_many :reminders, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_day, presence: true
  validates :gender, presence: true
  validates :nationality, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :security_number, uniqueness: true, presence: true, length: { is: 15, message:  "Your security number must be at least 15 letters." }
  validates :life_project, presence: true
end
