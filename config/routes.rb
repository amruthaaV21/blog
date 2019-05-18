Rails.application.routes.draw do
	root 'static_pages#home'
	resources :articles
	resources :users
	get 'users/:id/articles' => 'users#articles', :as => :users_articles
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
