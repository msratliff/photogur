Rails.application.routes.draw do
  
	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
  
	get 'tags/:tag', to: 'posts#index', as: :tag


  resources :posts do
    resources :comments
  end

	resources :users
	resources :sessions
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root "posts#index"
  
end
