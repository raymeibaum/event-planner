Rails.application.routes.draw do
  devise_for :users

	namespace :api do
    resources :users, only: [:show]
		resources :comments
		resources :favorites
		resources :events, only: [:index, :show]
  end

	root to: 'client#index'
	get '*path', to: 'client#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
