class Order < ApplicationRecord
    belongs_to :student
    has_many :courses, through: :courses_orders
end
