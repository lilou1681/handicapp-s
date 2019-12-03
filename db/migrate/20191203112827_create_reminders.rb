class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :name
      t.date :date
      t.references :children, foreign_key: true

      t.timestamps
    end
  end
end
