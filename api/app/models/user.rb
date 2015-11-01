class User < ActiveRecord::Base
  enum role: [:admin, :student, :instructor]
  after_initialize :set_role
  after_initialize :set_username
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :messages
  has_secure_password

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
