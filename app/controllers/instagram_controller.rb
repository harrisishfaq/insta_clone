class InstagramController < ApplicationController
  def home_page
  end

  def landing_page
      suggestion_users()
      @posts = Post.all.order(id: :desc)
      @sum = 0
  end
end
