module ApplicationHelper
    def message
        "Your Account is deavtivated, You can only access If it is activated, please view settings"
    end

    def is_account_activated?
        current_user&.setting&.account_status || !user_signed_in?
    end
end
