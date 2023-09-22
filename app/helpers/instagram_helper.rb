module InstagramHelper
    def page_number(sum)
        sum = sum + 1
    end

    def user_photo(u)
    return "no_photo.webp" unless u.profile_photo
    u.profile_photo if u.profile_photo.present?
    end
end
