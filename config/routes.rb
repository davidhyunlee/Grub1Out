Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :menus, :businesses
    end
  end

  resources :businesses do
    resources :menus do
      resources :menu_item_categories do
        resources :menu_items
      end
    end
    resources :reviews do
    end
  end

  devise_for :users, path_names: {sign_in:"login", sign_out: "logout"},
  controllers: {omniauth_callbacks: "omniauth_callbacks"}

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root to: "pages#index"

end
