class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: 'User'
  validates :content, presence: true

  def user1
    self.conversation.user1
  end

  def user2
    self.conversation.user2
  end
end
