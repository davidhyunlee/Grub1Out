Rails.application.routes.draw do




  resources :businesses do
    resources :reviews, :menus do
      resources :menu_item_categories
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
