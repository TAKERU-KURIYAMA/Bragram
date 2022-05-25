Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root :to =>"homes#top"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :rares, only: [:create, :destroy]
    resource :wonderfuls, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
