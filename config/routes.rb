Rails.application.routes.draw do
  devise_for :users

	root to: 'client#index'
	get '*path', to: 'client#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
