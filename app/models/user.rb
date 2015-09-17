class User < ActiveRecord::Base
  enum role: [:admin, :student, :instructor]
  after_initialize :set_role, :if => :new_record?

  def set_role
    if self.email .match /\A([\w\.%\+\-]+)(@ucf\.edu\z)/i
      self.role ||= :instructor
    else
      self.role ||= :student
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
