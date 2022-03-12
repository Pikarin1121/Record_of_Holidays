Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: 'about'

  resources :holidays, only: [:new, :index, :create, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :holiday_comments, only: [:create, :destroy]
  end

  resources :users, only:[:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  get 'searches/search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
