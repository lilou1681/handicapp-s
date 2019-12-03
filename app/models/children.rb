class Children < ApplicationRecord
  belongs_to :user
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birth_day, presence: true
    validates :gender, presence: true
    validates :nationality, presence: true
    validates :country, presence: true
    validates :address, presence: true
    validates :security_number, uniqueness: true, presence: true
    validates :life_project, presence: true
end
