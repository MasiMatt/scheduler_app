class Student < ActiveRecord::Base
  has_secure_password

  has_many :student_records
  before_save { |student| student.email = email.downcase}
  before_save :create_remember_token

  PROGRAM = ['Computer Science', 'Software Engineering']
  VALID_STUDENT_ID_REGEX = /\A\d{8}\z/
  VALID_EMAIL_REGEX = /\A\w+@concordia.ca\z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :student_id, format: {with: VALID_STUDENT_ID_REGEX}, uniqueness: true, presence: true
  validates :department, presence: true, inclusion: {in: PROGRAM}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true


  def self.departments
    return PROGRAM
  end

  def get_course_sequence
    return self.department.remove(" ").constantize.get_course_sequence
  end

  def get_record
    self.student_records.map do |course|
      course.get_record
    end
  end
  def full_name
    "#{first_name} #{last_name}"
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
