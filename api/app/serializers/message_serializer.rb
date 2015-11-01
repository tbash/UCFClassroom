class MessageSerializer < ActiveModel::Serializer
  attributes :id, :username, :course_id, :body
end
