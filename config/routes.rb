Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:index,:show] 
  resources :plans do
    resources :comments
    member do
      get 'take'
      get 'cancel'
    end
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root 'plans#index'
  resources :relationships, only: [:create, :destroy]
  get 'tags/:tag', to: 'plans#index', as: :tag 
  resources :conversations do
    resources :messages
  end
end
