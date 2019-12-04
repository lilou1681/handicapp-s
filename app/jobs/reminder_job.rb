class ReminderJob < ApplicationJob
  queue_as :default

  def perform()
    reminders = Reminder.where(date: Date.today)
    reminders.each do |reminder|
      reminder.children
      reminder.children.user

      puts "#{reminder.name}"
      # Mailer
    end
  end
end
