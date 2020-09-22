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
      registrations: 'members/registrations'
    }
  # -------------------- devise ------------------------------------------------

  # -------------------- admsin ------------------------------------------------
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

    get 'my_favorite', to: 'member/favorites#my_favorite'

    get 'my_calendar', to: 'member/events#my_calendar'

    get 'resignation', to: 'member/members#resignation'
    patch 'quit', to: 'member/members#quit'

    namespace :member do
      
      resources :members, only: [:show, :edit, :update]
      resources :clinics, only: [:show, :index] do
        resource :favorites, only: [:create, :destroy]
        resources :reviews, only: [:new, :index, :create, :destroy]
      end
      resources :events

    end
  # -------------------- member -----------------------------------------------
end
