class Friend < ApplicationRecord
    belongs_to :user
    APPROVE, REJECT, FRIEND, UNFRIEND, PENDING, BLOCK = 'approve', 'reject', 'friend', 'unfriend', 'pending', 'block'
    

    class << self 
      def get_all_pending_requests(current_user)
        User.joins(:friends)
        .where(friends: {friend_id: current_user.id, request_status: 'pending'})
        .pluck('friends.id','users.id','users.email')
      end

      def get_all_user_friends(current_user)
        User.joins(:friends)
        .where('friends.user_id = ? OR friends.friend_id = ?', current_user.id, current_user.id)
        .where(friends: {request_status: Friend::APPROVE})
        .where.not(friends: {friendship_status: Friend::BLOCK})     
        .pluck('friends.id', 'friends.friend_id', 'users.email')
        .map {|friend_tbl_id, friend_id, email| {friend_tbl_id: friend_tbl_id, friend_id: friend_id, email: email}}
      end
    end
end
