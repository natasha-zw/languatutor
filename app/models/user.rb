class User < ApplicationRecord
  # validation
  validates :first_name, presence: { message: 'Please provide a first name' }
  validates :last_name, presence: { message: 'Please provide a last name' }
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  # custom relation to find subjects studied by users that have the role student
  def studied_subjects
    subjects = []
    UserSubject.where(user_id: id, role_id: Role.find_by(name: 'student').id).each do |user_subject|
      sub = Subject.find(user_subject.subject_id)
      subjects.push(sub)
    end
    subjects
  end

  def taught_subjects
    subjects = []
    UserSubject.where(user_id: id, role_id: Role.find_by(name: 'tutor').id).each do |user_subject|
      sub = Subject.find(user_subject.subject_id)
      subjects.push(sub)
    end
    subjects
  end

  # relations
  has_many :taught_courses, class_name: 'Course', foreign_key: :tutor_id, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :studied_courses, through: :user_courses, source: :course
  has_many :orders, class_name: 'Order', foreign_key: :student_id
  has_one_attached :profile_photo, dependent: :purge_later
  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  # accepts_nested_attributes_for :subjects, :subject_roles
  

  def full_name 
    return "#{first_name} #{last_name}" 
  end
  def order
    return Order.find_by(student_id: id, complete: false) || Order.create(student_id: id, complete: false)
  end 

end
