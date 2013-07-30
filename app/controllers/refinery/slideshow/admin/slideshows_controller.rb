module Refinery
  module Slideshow
    module Admin
      class SlideshowsController < ::Refinery::AdminController

        crudify :'refinery/slideshow/slideshow',
                :title_attribute => 'uid'

      end
    end
  end
end
