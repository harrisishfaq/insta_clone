class ThirdPartyApi < ApplicationRecord
    class << self
        def rest_countries_api
            'https://restcountries.com/v3.1/all'
        end

        def city_api_by_country_name(country_code)
            "http://api.geonames.org/searchJSON?country=#{country_code}&maxRows=1000&username=haris"
        end
    end
end