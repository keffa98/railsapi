class PagesController < ApplicationController


    def read
        require 'json'
        require 'open-uri'

        url = 'https://api.github.com/users/aros'
        user_temp = open(url).read
        user = JSON.parse(user_temp)
    end
    
end
