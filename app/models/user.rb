class User < ApplicationRecord
  # validation
  validates :first_name, presence: { message: 'Please provide a first name' }
  validates :last_name, presence: { message: 'Please provide a last name' }
  validates :roles, presence: { message: 'Please pick how you will use the website!' }
  validates :profile_photo, attached: true, content_type: [:png, :jpg, :jpeg]
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  # relations
  has_many :taught_courses, class_name: 'Course', foreign_key: :tutor_id, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :studied_courses, through: :user_courses, source: :course
  has_many :orders, class_name: 'Order', foreign_key: :student_id
  has_one_attached :profile_photo, service: :cloudinary, dependent: :purge_later
  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  # accepts_nested_attributes_for :subjects, :subject_roles
  

  def full_name 
    return "#{first_name} #{last_name}" 
  end

  def order
    return Order.find_by(student_id: id, complete: false) || Order.create(student_id: id, complete: false)
  end

  def completed_orders
    return Order.where(student_id: id, complete: true)
  end 

end
