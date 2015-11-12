class Course < ActiveRecord::Base
  has_many :assignments
  has_many :slides
  has_many :enrollments
  has_many :messages
  has_many :users, through: :enrollments
end
