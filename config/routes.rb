Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end


  resources :student_posts, only: [:index, :new, :create, :edit, :update] do
    resources :favorites, only: [:create]
    delete 'favorites' => 'favorites#destroy', as:'favorite'
    resources :comments, only: [:create, :destroy]
  end

  resources :teacher_posts, only: [:index, :new, :create, :edit, :update] do
    resources :favorite_teachers, only: [:create]
    delete 'favorites' => 'favorite_teachers#destroy', as:'favorite'
    resources :comments, only: [:create, :destroy]
  end

  resources :messagess, only: [:create, :show]


  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end

end
