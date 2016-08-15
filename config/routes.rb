Rails.application.routes.draw do
 root  to: "images#index"

 resources :sessions, only: [:new, :create, :destroy]
 get "/login" => "sessions#new", as:"login"
 delete "/logout" => "sessions#destroy", as:"logout"

 resources :images do
   resources :candidates, only: [:create, :destroy, :update]
 end
  
 match  "/result" => "images#result" , as: "result", via: :get


end
