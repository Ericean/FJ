Rails.application.routes.draw do
 resources :images do
   resources :candidates, only: [:create, :destroy]
 end
 root  to: "images#index"
end
