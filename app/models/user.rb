class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :user_subjects
    has_many :subjects, through: :users_subjects
    has_one :course, class_name: 'course', foreign_key: 'teacher_id'
    has_many :orders, class_name: 'order', foreign_key: 'student_id'
    has_many :courses, through: :courses_users
    
end