Rails.application.routes.draw do
  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"

  get 'profiles/show'
  get 'posts', to: 'posts#index'
  get 'events', to: 'events#index'
  get 'pins', to: 'pins#index'
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments
    member do
      get 'like', to: "posts#like"
      get 'dislike', to: "posts#dislike"
    end
  end

  resources :albums
  resources :album_attachments
  resources :albums
  resources :pins do
    member do
      get 'like', to: "pins#like"
    end
  end
  resources :users, only: [:index]
  resources :events do
    member do
      get 'like', to: "events#like"
    end
  end
  resources :contacts, only: [:new, :create]

  get 'welcome/index'
  root 'welcome#index'


  get '*path' => redirect('/')
end
