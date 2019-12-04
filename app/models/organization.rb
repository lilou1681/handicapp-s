class Organization < ApplicationRecord
  validates :name, presence: true
  validates :adress, presence: true
  validates :phone_number, presence: true

  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?
end
