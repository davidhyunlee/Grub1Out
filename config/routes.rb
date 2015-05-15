Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :businesses do
        resources :menus
      end
    end
  end

  # post '/businesses/:business_id/menus/:menu_id/menu_item_categories/:menu_item_category_id/menu_items/:menu_item_id/menu_item_photos' => 'menu_item_photos#create'

  resources :businesses do
    resources :menus do
      resources :menu_item_categories do
        resources :menu_items do
          resources :menu_item_photos
        end
      end
    end
    resources :reviews do
    end
  end
  # resources :reviews, only: [:show, :update]

  devise_for :users, path_names: {sign_in:"login", sign_out: "logout"},
  controllers: {omniauth_callbacks: "omniauth_callbacks"}

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root to: "pages#index"

end
