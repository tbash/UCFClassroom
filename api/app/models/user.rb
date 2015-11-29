class User < ActiveRecord::Base
  after_initialize :set_role
  after_initialize :set_username
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :messages
  has_many :assignments
  validates_presence_of :email
  validates_presence_of :nid
  validates_uniqueness_of :authentication_token, allow_nil: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  has_secure_password
  enum role: [:student, :instructor, :admin]

  def set_role
    if self.email.match(/\A([\w\.%\+\-]+)(@ucf\.edu\z)/i)
      self.role ||= :instructor
    else
      self.role ||= :student
    end
  end

  def set_username
    self.username = self.email[/[^@]+/]
  end
end
