class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :due, :grade, :course_id, :student_id
  has_one :course
  has_one :student
end
