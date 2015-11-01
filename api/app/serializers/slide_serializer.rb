class SlideSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :course
end
