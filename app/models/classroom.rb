class Classroom < ActiveRecord::Base
  belongs_to :course
  has_many :messages

  accepts_nested_attributes_for :messages
end
