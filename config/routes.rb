Rails.application.routes.draw do
  resources :platforms
  resources :events
  resources :boards
  resources :webtoons
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get '/boards/:id', to: 'boards#index', as: 'board_index'
	get '/events/:id', to: 'events#index', as: 'event_index'
	
	root 'webtoons#index'
end
