class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructor_id
end
