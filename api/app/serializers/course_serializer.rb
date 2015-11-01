class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructor_id
  
  has_many :users
  has_many :slides
  has_many :assignments
end
