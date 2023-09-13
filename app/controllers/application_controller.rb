class ApplicationController < ActionController::Base
    require 'rest-client'
    require 'json'
    
    def after_sign_in_path_for(resource)
        instagram_landing_page_path(resource)
    end

    def after_sign_up_path_for(resource)
        instagram_landing_page_path(resource)
    end

    def suggestion_users
        @suggestion_users = []
        User.all.where.not(email: current_user.email).each do |u|
         if u.setting.show_me_in_suggestions and ApplicationRecord.request_sent_by_user(current_user, u) and ApplicationRecord.request_recieved_to_user(current_user, u) and u.setting.account_status
            @suggestion_users.push(u)
         end
        end
        
    end
end
