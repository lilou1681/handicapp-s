class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    reminders = Reminder.where(date: Date.tomorrow)
    reminders.each do |reminder|
      if reminder.sending == false
        ReminderMailer.notification(reminder).deliver_now
        reminder.update(sending: true)
      end
      # Mailer
    end
  end
end
