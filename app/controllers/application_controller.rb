class ApplicationController < ActionController::Base
  helper_method :friendship_exists?, :respond?, :sent_request?

  def friendship_exists?(user1_id, user2_id)
     friendship = Friendship.where(user_id: user1_id, friend_id: user2_id, confirm: true).or(Friendship.where(friend_id: user1_id, user_id: user2_id, confirm: true))
     friendship.empty? ? false : true
  end

  def respond?(user1_id, user2_id)
    friendship = Friendship.where(friend_id: user1_id, user_id: user2_id, confirm: false)
    friendship.empty? ? false : true
  end

  def sent_request?(user1_id, user2_id)
    friendship = Friendship.where(user_id: user1_id, friend_id: user2_id, confirm: false)
    friendship.empty? ? false : true
  end
end
