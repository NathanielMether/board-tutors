class ContactsController < ApplicationController
  def index
    # Get the relevant users
    as_user1 = Conversation.where(user1: current_user)
    as_user2 = Conversation.where(user2: current_user)
    @contacts = as_user1 | as_user2

    # Get the other profile in the conversation to access a profile picture
    if @contacts.first.user1 == current_user
      @profile = Profile.where(user: as_user1.first.user2).first
    elsif @contacts.first.user2 == current_user
      @profile = Profile.where(user: as_user2.first.user1).first
    end
  end
end
