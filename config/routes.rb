Refinery::Core::Engine.routes.append do

  namespace :slideshow, path: '' do
    namespace :admin, :path => 'refinery' do
      resources :slideshows, :except => :show do
        resources :slides, :except => :show
      end
    end
  end

end
