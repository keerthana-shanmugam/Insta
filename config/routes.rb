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
  get '/posts' , to: 'posts#user_post'
  post '/new_posts', to: 'posts#create'
  delete 'delete_posts/:id', to: 'posts#delete'

  get 'profile/search_profile'
  get '/search_profile', to: 'profile#search_profile'

  # post '/follow_request/:id', to: 'profile#follow_request'
  get '/follow_request/:id', to: 'profile#follow'
  delete 'delete_request/:id', to: 'profile#unfollow'

  get '/user_like/:id', to: 'home#like'
  delete 'delete_like/:id', to: 'home#unlike'
end
