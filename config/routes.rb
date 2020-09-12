Rails.application.routes.draw do 

  # -------------------- devise -----------------------------------------------
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
  # -------------------- devise -----------------------------------------------

  # -------------------- admin ------------------------------------------------
    root to: 'member/clinics#top'
    get 'clinics/about', to: 'member/clinics#about', as: 'clinics_about'

    get 'admin/top', to: 'admin/members#top', as: 'admin_members_top'

    namespace :admin do

      resources :members, only: [:index, :show, :edit, :update]
      resources :clinics
      resources :consultation_hours, only: [:create, :update, :destroy]
      resources :genres, except: [:show]
      
    end
  # -------------------- admin ------------------------------------------------
  
  # -------------------- member -----------------------------------------------
    get 'member/my_calendar', to: 'member/events#my_calendar'

    namespace :member do
      
      resources :members, only: [:show, :edit, :update]
      resources :clinics, only: [:show, :index]
      resources :events

    end
  # -------------------- member -----------------------------------------------
end
