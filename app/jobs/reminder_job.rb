class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    reminders = Reminder.where(date: Date.tomorrow)
    reminders.each do |reminder|
      ReminderMailer.notification(reminder).deliver_now
      # Mailer
    end
  end
end
