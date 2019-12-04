class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :adress
      t.string :phone_number
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
