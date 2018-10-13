Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contacts#index', as: 'home'

  get 'contacts/search', as: 'search_contacts'

  get 'contacts/results', as: 'contacts_search_results'

  get 'users/search', as: 'search_users'

  get 'users/results', as: 'users_search_results'
  # get 'users', to: 'users#index'
  resources :users, except: :create

  post 'create_user' => 'users#create', as: :create_user  

  post 'active_user' => 'users#active_user', as: :active_user
  post 'deactive_user' => 'users#de_active_user', as: :deactive_user

  resources :contacts do
  	resources :calls
  end
end
