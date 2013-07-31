module Refinery::Slideshow
  class Slide < ActiveRecord::Base

    belongs_to :slideshow
    translates :title, :body, :main_image_uid, :main_image_name, :video_url, fallbacks_for_empty_translations: true

    image_accessor :main_image if respond_to?(:image_accessor)

    class Translation
      attr_accessible :title, :body, :slide_image, :video_url
    end

  end
end
