

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

    setup do
        user = users(:one)

        @header = {
            'X-User-Email': user.email,
            'X-User-Token': user.authentication_token
        }
    end

    test 'creates account for user' do
        
        account_params = {
            name: Faker::Company.name,
            address: Faker::Address.street_name,
            default_currency: Faker::CryptoCoin.coin_name
        }

        post user_session_path, headers: @header, params: { user: account_params}
        assert_response :success
    end

end
