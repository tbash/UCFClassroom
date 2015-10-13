class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :classroom

  after_commit { MessageRelayJob.perform_later(self) }
end
