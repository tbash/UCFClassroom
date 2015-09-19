class Channel < ActiveRecord::Base
  belongs_to :course
  has_one :slideshow
  has_one :messenger
end
