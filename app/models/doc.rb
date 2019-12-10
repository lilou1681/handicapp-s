class Doc < ApplicationRecord
  belongs_to :children
  mount_uploader :file, FileUploader

  NAMES = ["CERFA MDPH", "CERFA Certificat médical", "Projet de vie"]

  validates :name, presence: true, inclusion: { in: NAMES }
end
