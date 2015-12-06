class SlideContainerSerializer < ActiveModel::Serializer
  attributes :id, :course_session_id, :slides
  has_one :course
end
