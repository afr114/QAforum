Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resources :users

  resources :sessions

  get     'login'  => 'sessions#new'
  post    'login'  => 'sessions#create'
  delete  'logout' => 'sessions#destroy'

end
