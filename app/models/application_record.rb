class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

class << self

  def get_countries
    @countries = RestClient.get "#{ThirdPartyApi.rest_countries_api}"
    @parsed_data = JSON.parse(@countries)
    
    return @parsed_data.map do |pd|
      [pd["name"]["common"] , pd["altSpellings"][0]]
    end
  end

  def get_cities(country_code)
   
      @cities = RestClient.get "#{ThirdPartyApi.city_api_by_country_name(country_code)}"
      @parsed_data = JSON.parse(@cities)
      
      return @parsed_data.to_a.last.last.map do |city_name|
                city_name["name"]
      end
  end

  def request_sent_by_user(current_user, u)
     !current_user&.friends.where(request_status: 'approve').pluck(:friend_id).include? u.id
  end

  def request_recieved_to_user(current_user, u)
     !u&.friends.where(request_status: 'approve').pluck(:friend_id).include? current_user.id
  end
end
end
