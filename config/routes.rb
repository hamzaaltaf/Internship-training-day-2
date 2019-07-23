Rails.application.routes.draw do
  # get post put patch delete
  resources :users
  namespace :api do
    namespace :v1 do
    resources :users, only: [:create, :update, :destroy, :index] do
      collection do
        post 'update_password'
      end

      member do
        
      end
    end
  end
end
end
