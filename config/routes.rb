Rails.application.routes.draw do
    mount Ckeditor::Engine => '/ckeditor'
	root 'articles#main'
	#resources :articles
	resources :users
	get 'users/:id/articles' => 'users#articles', :as => :users_articles
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	
	resources :articles do
    resources :comments
  end	
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
