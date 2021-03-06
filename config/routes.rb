Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	namespace :api do
    resources :users, only: [:show]

		# event categories
		get 'events', to: 'events#events_all'
		get 'events/categories', to: 'events#categories'
		get 'events/:id', to: 'events#show'
		get 'events/categories/:id', to: 'events#events_with_specifics'

		# event comments
		post 'events/:event_id/comments', to: 'comments#create'
		delete 'events/:event_id/comments/:id', to: 'comments#destroy'

		#event favorites
		post 'events/:event_id/favorites', to: 'favorites#create'
		delete 'events/:event_id/favorites/:id', to: 'favorites#destroy'

		# auth
		get 'auth/user', to: 'auth#get_user'
  end

	# client
	get 'home', to: 'client#index'
	get 'about', to: 'client#about'
	root to: 'client#home'

	get '*path', to: 'client#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
