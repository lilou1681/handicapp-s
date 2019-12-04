namespace :reminder do
  desc "TODO"
  task notify: :environment do
    ReminderJob.perform_later
  end
end
