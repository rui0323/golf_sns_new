Rails.application.routes.draw do
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :admin do
resources :customers, only: [:index, :show]
resources :posts, only: [:index, :show, :edit, :create, :new, :update]
end


scope module: :public do
root "homes#top"
resources :customers, only: [:show, :update, :edit, :index]
resources :posts, only: [:index, :show, :edit, :create, :new, :update, :destroy] do
resources :post_comments, only: [:create]
end
get "/customers/:id/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
patch "/customers/:id/withdraw" => "customers#withdraw", as: "withdraw"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
