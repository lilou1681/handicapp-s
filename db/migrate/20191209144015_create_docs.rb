class CreateDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :docs do |t|
      t.string :name
      t.string :url
      t.references :children, foreign_key: true

      t.timestamps
    end
  end
end
