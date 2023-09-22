class UsersController < ApplicationController
  def profile
    @countries_name = ApplicationRecord.get_countries
    @cities_name =  ApplicationRecord.get_cities

    respond_to do |format|
    #  format.js { @cities_name }
     format.html
    end
  end

  def update_profile
     current_user.update(profile_params)
     respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.update("flash", "User Updated Successfully!"),
                              turbo_stream.update("profile_photo" , partial: "users/profile_photo" , locals: {user: current_user} )]
      end
     end
  end

  private
  def profile_params
     params.require(:user).permit!
  end
end
