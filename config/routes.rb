Rails.application.routes.draw do
 root  to: "images#index"

 resources :sessions, only: [:new, :create, :destroy]
 get "/login" => "sessions#new", as:"login"
 delete "/logout" => "sessions#destroy", as:"logout"

 
 resources :images do
   match "/reset" => "candidates#reset", as: :reset, via: :post
   resources :candidates, only: [:create, :destroy, :update] do
   end
 end
   		
 match "/images/:image_id/pin/:candidate_id/"  => "candidates#pin", as: :pin, via: :post		
 match  "/result" => "images#result" , as: "result", via: :get

end
