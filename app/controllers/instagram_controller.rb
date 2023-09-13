class InstagramController < ApplicationController
  def home_page
  end

  def landing_page
      suggestion_users()
  end
end
