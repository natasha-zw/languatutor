class Order < ApplicationRecord
    belongs_to :student
    has_many :courses, through: :course_orders
end
