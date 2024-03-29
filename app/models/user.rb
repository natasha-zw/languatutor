class User < ApplicationRecord
  # validation
  validates :first_name, presence: { message: 'Please provide a first name' }
  validates :last_name, presence: { message: 'Please provide a last name' }
  validates :roles, presence: { message: 'Please pick how you will use the website!' }
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_messageable

  # relations
  has_many :taught_courses, class_name: 'Course', foreign_key: :tutor_id, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :studied_courses, through: :user_courses, source: :course
  has_many :orders, class_name: 'Order', foreign_key: :student_id
  has_one_attached :profile_photo, service: :cloudinary, dependent: :purge_later
  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  # custom methods 
  def full_name 
    "#{first_name} #{last_name}"
  end

  def order
    Order.find_by(student_id: id, complete: false) || Order.create(student_id: id, complete: false)
  end

  def completed_orders
    Order.where(student_id: id, complete: true)
  end

  def students
    User.where()
  end

  def mailboxer_email(object)
    self.email
  end

end
