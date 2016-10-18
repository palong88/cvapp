class Cv < ApplicationRecord
  has_attached_file :file
  validates_attachment :file, content_type: { content_type: "application/pdf" }
  belongs_to :job
end
