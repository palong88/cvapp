class Candidate < ApplicationRecord
  resourcify
  belongs_to :job
  has_attached_file :cv
  validates_attachment :cv, content_type: { content_type: "application/pdf" }

end
