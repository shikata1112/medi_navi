Rails.application.routes.draw do 

  # -------------------- devise ------------------------------------------------
    devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
    }

    devise_for :members, controllers: {
      sessions:      'members/sessions',
      passwords:     'members/passwords',
      registrations: 'members/registrations',
      omniauth_callbacks: 'members/omniauth_callbacks'
    }

    devise_scope :member do
      post 'members/guest_sign_in', to: 'members/sessions#new_guest'
    end

  # -------------------- devise ------------------------------------------------

  # -------------------- admin ------------------------------------------------
    namespace :admin do

      get 'top', to: 'members#top', as: 'members_top'

      resources :members, only: [:index, :show, :edit, :update]
      resources :clinics
      resources :consultation_hours, only: [:create, :update, :destroy]
      resources :genres, except: [:show]
      
    end
  # -------------------- admin ------------------------------------------------
  
  # -------------------- member -----------------------------------------------
    root to: 'member/clinics#top'

    get 'clinics/about', to: 'member/clinics#about'

    get 'clinics/search', to: 'member/clinics#search'

    get 'clinics/genre_search', to: 'member/clinics#genre_search'

    get 'clinics/prefecture_search', to: 'member/clinics#prefecture_search'

    get 'clinics/sort', to: 'member/clinics#sort'

    get 'my_favorite', to: 'member/favorites#my_favorite'

    get 'my_calendar', to: 'member/events#my_calendar'

    get 'resignation', to: 'member/members#resignation'
    patch 'quit', to: 'member/members#quit'

    namespace :member do
      resources :messages, only: [:create, :destroy]
      resources :rooms, only: [:create, :index, :show]
      resources :coupons, only: [:index, :destroy]
      resources :notifications, only: :index
      delete 'notifications', to: 'notifications#destroy_all'
      
      resources :members, only: [:show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
        get :follows, on: :member
        get :followers, on: :member
      end
      resources :clinics, only: [:show, :index] do
        resource :favorites, only: [:create, :destroy]
        resources :reviews, only: [:new, :index, :create]
      end
      resources :events

    end
  # -------------------- member -----------------------------------------------

  namespace :api do
    resources :clinics, only: [:index]
  end

end
