class MessageSerializer < ActiveModel::Serializer
  attributes :id, :username, :course_id, :body

  belongs_to :user
  belongs_to :course
end
