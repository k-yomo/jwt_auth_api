Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, format: :json do
    namespace :auth do
      post 'sign_in' => 'user_token#create'
      get 'me' => 'users#show'
      delete 'me' => 'users#destroy'
    end
    resources :users, only: %i[create]
  end
end
