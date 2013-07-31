module Refinery
  module Slideshow
    module Admin
      class SlidesController < ::Refinery::AdminController

        before_filter :find_slideshow
        before_filter :set_slideshow, only: [:create, :update]

        crudify :'refinery/slideshow/slide', redirect_to_url: :redirect_url

        def find_slideshow
          @slideshow ||= Refinery::Slideshow::Slideshow.find(params[:slideshow_id]) unless params[:slideshow_id].nil?
          error_404 if @slideshow.nil?
        end
        private :find_slideshow

        def set_slideshow
          params[:slide][:slideshow_id] = @slideshow.id unless @slideshow.nil?
        end
        private :find_slideshow

        def find_slide
          find_slideshow
          @slide = @slideshow.slides.find(params[:id])
        end
        private :find_slide

        def redirect_url
          refinery.edit_slideshow_admin_slideshow_path @slideshow
        end
        private :redirect_url


      end
    end
  end
end
