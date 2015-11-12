class Message < ActiveRecord::Base
  after_initialize :set_username
  belongs_to :user
  belongs_to :course

  def set_username
    self.username = User.find(self.user_id).username
  end
end
