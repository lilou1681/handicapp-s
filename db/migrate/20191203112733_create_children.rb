class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :birth_day
      t.string :gender
      t.string :nationality
      t.string :country
      t.string :address
      t.string :security_number
      t.string :life_project
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
