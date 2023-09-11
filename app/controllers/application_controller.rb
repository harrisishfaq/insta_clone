class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        instagram_landing_page_path(resource)
    end

    def after_sign_up_path_for(resource)
        instagram_landing_page_path(resource)
    end
end
