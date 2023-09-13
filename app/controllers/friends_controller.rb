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

  private
  
  def already_sent_request(user)
    Friend.find_by(user_id: [current_user.id, user.id], friend_id: [user.id, current_user.id], request_status: Friend::PENDING) ? true : false
  end

end
