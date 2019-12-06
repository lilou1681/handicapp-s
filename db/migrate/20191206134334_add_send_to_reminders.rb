class AddSendToReminders < ActiveRecord::Migration[5.2]
  def change
    add_column :reminders, :sending, :boolean, default: false
  end
end
