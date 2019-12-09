class Doc < ApplicationRecord
  belongs_to :children

  mount_uploader :file, FileUploader
end
