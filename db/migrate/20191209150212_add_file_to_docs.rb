class AddFileToDocs < ActiveRecord::Migration[5.2]
  def change
    add_column :docs, :file, :string
  end
end
