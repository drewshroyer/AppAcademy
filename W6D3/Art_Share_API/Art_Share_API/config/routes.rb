Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :destroy, :index, :show, :update] do 
    resources :artworks, only: [:index]   #this will make a column nested to another table - you can only nest one column at a time 
  end

  resources :artworks, only: [:create, :destroy, :index, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:index, :create, :destroy]  
  #   resources :artworks, only: [:index]
  #   resources :users, only: [:index]
  # end

end
