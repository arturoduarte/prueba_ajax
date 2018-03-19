Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'comments/create'

	resources :companies do
		resources :comments, only: [:create]
	end
	
	devise_for :users
	root 'companies#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
end
