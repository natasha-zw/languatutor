class UserSubject < ApplicationRecord

  # relations
  belongs_to :user
  belongs_to :subject
end
