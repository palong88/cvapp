class Job < ApplicationRecord
  belongs_to :user
  has_many :candidates, dependent: :destroy
  has_many :cvs, dependent: :destroy 
end
