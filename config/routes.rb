Refinery::Core::Engine.routes.append do

  namespace :slideshow, path: '' do
    namespace :admin, :path => 'refinery' do
      resources :slideshows, :except => :show do
        collection do
          post :update_positions
        end
        member do
          post :merge
        end
      end
    end
  end

end
