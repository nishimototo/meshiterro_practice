Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'post_images/index'
  get 'post_images/show'
  get 'post_images/new'
  devise_for :users
  root "homes#top"

  resources :post_images, only:[:index, :show, :new, :create, :destroy] do
    resources :post_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :users, only:[:show, :edit, :update]
end
