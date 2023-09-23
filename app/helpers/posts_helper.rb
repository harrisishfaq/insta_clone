module PostsHelper

    def post_user(post)
        post.user == current_user ? 'You' : post.user.email
    end

    def users_post(post)
       post.user == current_user
    end
end
