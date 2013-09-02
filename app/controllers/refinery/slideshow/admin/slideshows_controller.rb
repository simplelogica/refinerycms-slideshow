module Refinery
  module Slideshow
    module Admin
      class SlideshowsController < ::Refinery::AdminController

        crudify :'refinery/slideshow/slideshow',
                :title_attribute => 'uid'

        def find_all_slideshows
          @slideshows = Refinery::Slideshow::Slideshow.not_attached
        end

      end
    end
  end
end
