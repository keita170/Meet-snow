Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
    collection do
      get :favorites
    end
  end


  resources :student_posts, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :favorites, only: [:create]
    delete 'favorites' => 'favorites#destroy', as:'favorite'
    resources :comments, only: [:create, :destroy]
  end

  resources :teacher_posts, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :favorite_teachers, only: [:create]
    delete 'favorites' => 'favorite_teachers#destroy', as:'favorite'
    resources :comment_teachers, only: [:create, :destroy]
  end

  resources :messages, only: [:create, :show]
  resources :rooms, only: [:create, :show, :index]

  get 'search' => 'searches#search'
  get 'search_teacher' => 'search_teachers#search'


  namespace :admins do
    resources :users, only: [:index, :edit, :update]
  end

end
