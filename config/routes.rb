Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'what-is-phab', to: 'pages#about'
  get 'club-news', to: 'pages#news'
  get 'whats-on', to: 'pages#events'
  get 'shop', to: 'pages#shop'
  get 'contact-us', to: 'pages#contact_us'
  
  resources :pages do
    member do
  		get :published
  	end
  end
  
  resources :clubs
  
  
end
