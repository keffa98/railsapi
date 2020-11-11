class Api::V1::BaseController < ActionController::API

include Pundit

after_action :verify_authorized, except: [:index , :show , :create , :destroy]
after_action :verify_policy_scoped, only: [:index , :show , :create , :destroy]


rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
rescue_from ActiveRecord::RecordNotFound, with: :not_found


private

def user_not_authorized(exception)

    render json: {
        error: exception.message
    },status: :unhautorized
end    

def not_found(exception)

    render json: {error: exception.message},status: :not_found

end    



end
