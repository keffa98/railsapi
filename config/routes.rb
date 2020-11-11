Rails.application.routes.draw do
    #redirect_to  @car
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


  get 'read' , to: 'pages#read'


  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :cars, only: [ :index , :create , :show , :destroy, :update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :cars, only: [:create, :index, :destroy]

  resources :cars do
    resources :reviews, only: [ :new, :create , :index ] 
  end

 
end
