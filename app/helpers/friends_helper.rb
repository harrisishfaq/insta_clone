module FriendsHelper
    
    def request_status(u)
      Friend.find_by(user_id: [current_user.id, u.id], friend_id: [u.id, current_user.id], request_status: 'pending').present? ? true : false
    end
end
