class AddPhotoToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :photo, :string
  end
end
