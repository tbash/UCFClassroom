class Course < ActiveRecord::Base
  has_many :assignments
  has_many :slide_containers
  has_many :enrollments
  has_many :messages
  has_many :users, through: :enrollments
  accepts_nested_attributes_for :messages
end
