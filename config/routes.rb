Rails.application.routes.draw do
  get 'posts/new'
  get 'profile/new'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
 devise_scope :user do
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
 end
 
  post '/new_posts', to: 'posts#create'
  get '/search' , to: 'profile#search'
end
