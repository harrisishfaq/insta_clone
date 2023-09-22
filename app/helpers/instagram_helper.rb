module InstagramHelper
    def page_number(sum)
        sum = sum + 1
    end

    def user_photo(u)
    return "no_photo.webp" unless u.profile_photo
    u.profile_photo if u.profile_photo.present?
    end

    def user_like_this_post(post)
        current_user.user_like_posts.where(post_id: post.id).present?
    end

    def total_likes(post)
      post.user_like_posts.count
    end
end
