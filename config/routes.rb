Rails.application.routes.draw do
  get 'contact/new'

  devise_for :admins, controllers: { registrations: 'admins/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'what-is-phab', to: 'pages#about'
  get 'club-news', to: 'pages#news'
  get 'whats-on', to: 'pages#events'
  get 'shop', to: 'pages#shop'
  get 'contact-us', to: 'pages#contact_us'
  
  get 'dashboard', to: 'admins#dashboard'
  get 'admins', to: 'admins#index'
  
  get 'gallery_list', to: 'galleries#gallery_admin'
  get 'event_list', to: 'pages#event_list'
  get 'news_list', to: 'pages#news_list'
  get 'home_list', to: 'pages#home_list'
  
  resources :pages do
    member do
  		get :published
  	end
  end
  
  resources :clubs
  
  resources :galleries do 
    member do
  		get :published
  	end
    resources :pictures do
      member do
        post :make_default
      end
    end
  end
  
  
  resources :contacts, only: [:new, :create]
  
  
  
  
end
