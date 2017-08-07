Rails.application.routes.draw do
  
	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :posts do
    resources :comments
    resources :tags
  end

	resources :users
	resources :sessions
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root "posts#index"
  
end
