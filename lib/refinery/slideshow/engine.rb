module Refinery
  module Slideshow
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Slideshow

      initializer "register refinerycms_slideshow plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_slideshow"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.slideshow_admin_posts_path }
          plugin.menu_match = /refinery\/slideshow\/?/
          plugin.activity = { :class_name => :'refinery/slideshow/slideshow' }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Slideshow)
      end
    end
  end
end
