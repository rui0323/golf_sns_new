Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
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
resources :customers, only: [:show, :update, :edit, :index, :favorites] do
    member do
      get :favorites
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
resources :posts, only: [:index, :show, :edit, :create, :new, :update, :destroy] do
  resources :post_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  resource :favorites, only: [:create, :destroy]
end
get "/customers/:id/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
patch "/customers/:id/withdraw" => "customers#withdraw", as: "withdraw"


end

get '/search', to: 'searchs#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# ネストさせる


end
