Rails.application.routes.draw do
  # Back admin routes start
  namespace :admin do
    resources :users
    resources :customers
    
    # Admin root
    root to: 'application#index'
  end
  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # Application root
  devise_scope :user do
    authenticated :user do
     root 'admin/application#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # Front routes end
end
