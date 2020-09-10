Rails.application.routes.draw do
  
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

  root to: 'member/clinics#top'
  get 'clinics/about', to: 'member/clinics#about', as: 'clinics_about'

  get 'admin/top', to: 'admin/members#top', as: 'admin_members_top'

  namespace :admin do

    resources :members, only: [:index, :show, :edit, :update]
    resources :clinics
    resources :consultation_hours, only: [:create, :update, :destroy]
    resources :genres, except: [:show]
    
  end

  namespace :member do
    
    resources :members, only: [:show, :edit, :update]
    resources :clinics, only: [:show]

  end

end
