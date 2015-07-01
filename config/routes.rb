Rails.application.routes.draw do

  devise_for :users

  resources :pizzerias do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index]
  end

  root 'pizzerias#index'

end
