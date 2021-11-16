class Subject < ApplicationRecord
  # validation
  validates :name, presence: true
  
  # relationships
  has_many :user_subjects
  has_many :users, through: :user_subjects
end
