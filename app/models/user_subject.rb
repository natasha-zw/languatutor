class UserSubject < ApplicationRecord
  scope :studied, -> {Subject.where(id: subject_id)}

  belongs_to :user
  belongs_to :subject
end
