class User < ActiveRecord::Base
  enum role: [:admin, :student, :instructor]
  after_initialize :set_role
  after_initialize :set_user_name
  has_and_belongs_to_many :courses
  has_many :messages

  def set_role
    if self.email .match /\A([\w\.%\+\-]+)(@ucf\.edu\z)/i
      self.role ||= :instructor
    else
      self.role ||= :student
    end
  end

  def set_user_name
    self.user_name = self.email[/[^@]+/]
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
