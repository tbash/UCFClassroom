class User < ActiveRecord::Base
  after_initialize :set_role
  after_initialize :set_username
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :messages
  has_many :assignments
  has_secure_password
  enum role: [:admin, :student, :instructor]

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
