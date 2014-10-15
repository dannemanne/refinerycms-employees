Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :employees do
    resources :sick_leaves, :only => [:index, :create, :edit, :update] do
      member do
        get :add_note
        post :create_note
      end
    end
    resources :annual_leaves, :only => [:index, :create, :edit, :update]
    resources :employees, :only => [:index, :show]
    resources :expense_claims do
      resources :receipts, only: [:new, :create, :edit, :update, :destroy]
      post :submit, on: :member
    end
  end

  # Admin routes
  namespace :employees, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :employees, :except => :show do
        collection do
          post :update_positions
        end
        member do
          post :load_xero_guids
        end
      end

      resources :sick_leaves, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :annual_leaves, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :employment_contracts, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :public_holidays, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
