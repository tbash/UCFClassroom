class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :users
end
