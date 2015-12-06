class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructor_id
  
  has_many :users
  has_many :slide_containers
  has_many :assignments
  has_many :messages
end
