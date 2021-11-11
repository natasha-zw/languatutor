class User < ApplicationRecord
  # validation
  validates :first_name, presence: { message: 'Please provide a first name' }
  validates :last_name, presence: { message: 'Please provide a last name' }

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :user_subjects
  # has_many :subjects, through: :user_subjects
  # has_many :studied_subjects, class_name: 'Subject', foreign_key:

  # custom relation to find subjects studied by users that have the role student
  def studied_subjects
    subjects = []
    UserSubject.where(user_id: id, role_id: Role.find_by(name: 'student').id).each do |user_subject|
      sub = Subject.find(user_subject.subject_id)
      subjects.push(sub)
    end
    subjects
  end
  
  # relations
  has_many :taught_courses, class_name: 'Course', foreign_key: :tutor_id
  has_many :user_courses
  has_many :studied_courses, through: :user_courses, source: :course
  has_many :orders, class_name: 'Order', foreign_key: :student_id
end
