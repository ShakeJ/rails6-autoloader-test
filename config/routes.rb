Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :auth do
    post :login, to: "user_token#create"
  end
end
