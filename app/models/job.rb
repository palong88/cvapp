class Job < ApplicationRecord
  belongs_to :user

  has_many :candidates, dependent: :destroy
  has_many :cvs, dependent: :destroy
  has_many :requirements, dependent: :destroy
end
