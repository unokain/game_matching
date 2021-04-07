Rails.application.routes.draw do
  devise_for :users
  resources :plans
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root 'plans#index'
end
