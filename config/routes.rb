Rails.application.routes.draw do
  root to: 'agreements#index'
  resources :agreements

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    root to: "home#index"
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
