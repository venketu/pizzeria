Rails.application.routes.draw do

  devise_for :users

  resources :pizzarias do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index]
  end

  root 'pizzarias#index'

end
