class FriendsController < ApplicationController
  def friend_request
    return false unless params[:id].present?
    user_request = User.find(params[:id])
    return false if already_sent_request(user_request)
    request = current_user.friends.build(friend_id: user_request.id) if user_request
    if request.save!
       respond_to do |format|
          # format.turbo_stream do
          #  render turbo_stream: [turbo_stream.update("flash" , "Request sent successfully"),
          #                        turbo_stream.update("updated_card", partial: "instagram/slider", locals: {suggestion_user: suggestion_users})]
          # end
          format.html { redirect_to instagram_landing_page_path, notice: "Request sent successfully!" }
       end
    else

    end
  end

  def pending_requests
    @requests = Friend.get_all_pending_requests(current_user)
  end

  def approve_request
     return false unless params[:id]
     record = Friend.find(params[:id])
     record.update(request_status: Friend::APPROVE, friendship_status: Friend::FRIEND) if record.present?
     format.html { redirect_to instagram_landing_page_path, notice: "Request approved successfully!" }
  end

  def reject_request
     return false unless params[:id]
     record = Friend.find(params[:id])
     record.update(request_status: Friend::REJECT, friendship_status: Friend::UNFRIEND) if record.present?
     format.html { redirect_to instagram_landing_page_path, notice: "Request rejected successfully!" }
  end

  def user_friends
    @user_friends = Friend.get_all_user_friends(current_user)
  end

  def block_or_unfriend
    Friend.find(params[:id]).update(request_status: set_request_status, friendship_status: params[:action_performable], blocked_by: blocked_by_user)
  end

  def blocked_users
    @blocked_users = User.joins(:friends)
                         .where(friends: {friendship_status: "block", blocked_by: current_user.id})
                         .pluck("friends.id", "friends.friend_id", "friends.user_id")
                         .map{|friends_tbl_id, friend_id, user_id| {tbl_id: friends_tbl_id, email: user_id == current_user.id ? User.find(friend_id).email : current_user.email } }
  end


  def unblock_user
    Friend.find(params[:id]).update(blocked_by: nil, friendship_status: Friend::FRIEND)
  end
  private
  
  def already_sent_request(user)
    Friend.find_by(user_id: [current_user.id, user.id], friend_id: [user.id, current_user.id], request_status: Friend::PENDING) ? true : false
  end

  def set_request_status
    params[:action_performable] == Friend::UNFRIEND ? nil : Friend::APPROVE
  end

  def blocked_by_user
    params[:action_performable] == Friend::BLOCK ? current_user.id : nil
  end
end
