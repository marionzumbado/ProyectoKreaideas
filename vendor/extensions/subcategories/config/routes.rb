Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :subcategories do
    resources :subcategories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :subcategories, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :subcategories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
