class SlideContainer < ActiveRecord::Base
  belongs_to :course
  has_many :slides
end
