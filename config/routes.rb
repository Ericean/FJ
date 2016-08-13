Rails.application.routes.draw do
 root  to: "images#index"

 resources :images do
   resources :candidates, only: [:create, :destroy]
 end
 
 resources :sessions, only: [:new, :create, :destroy]

 get "/login" => "sessions#new", as:"login"
 delete "/logout" => "sessions#destroy", as:"logout"


end
