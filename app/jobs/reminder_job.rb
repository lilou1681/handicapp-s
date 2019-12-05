class ReminderJob < ApplicationJob
  queue_as :default

  def perform()
    reminders = Reminder.where(date: Date.today)
    reminders.each do |reminder|
      reminder.children
      reminder.children.user.email
      ReminderMailer.notification(reminder).deliver_now

      puts "#{reminder.name}"
      # Mailer
    end
  end
end
