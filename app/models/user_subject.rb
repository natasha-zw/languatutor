class UserSubject < ApplicationRecord
  scope :studied, -> {Subject.where(id: subject_id)}

  # relations
  belongs_to :user
  belongs_to :subject
end
