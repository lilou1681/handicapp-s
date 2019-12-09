class Reminder < ApplicationRecord
  belongs_to :children

  validates :name, presence: true
  validates :date, presence: true

  def start_time
    self.date.try(:to_datetime)
  end

end
