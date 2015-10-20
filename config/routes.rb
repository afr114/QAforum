Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    member { post :vote }
    resources :answers
  end

  resources :users

  resources :sessions

  get     'login'  => 'sessions#new'
  post    'login'  => 'sessions#create'
  delete  'logout' => 'sessions#destroy'

end
