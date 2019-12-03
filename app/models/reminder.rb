class Reminder < ApplicationRecord
  belongs_to :children

  validates :name, presence: true
  validates :date, presence: true
end
