class Subject < ApplicationRecord
    has_many :user_subjects
    has_many :users, through: :users_subjects
end
