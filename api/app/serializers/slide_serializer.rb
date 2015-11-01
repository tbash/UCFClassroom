class SlideSerializer < ActiveModel::Serializer
  attributes :id, :course_session, :content
  has_one :course
end
