class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :assignment_type, :due, :grade, :course_id, :user_id
  has_one :course
  has_one :user
  has_many :problems
end
