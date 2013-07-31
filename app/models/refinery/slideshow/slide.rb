module Refinery::Slideshow
  class Slide < ActiveRecord::Base

    belongs_to :slideshow
    translates :title, :body, :slide_image_uid, :slide_image_name, :video_url, fallbacks_for_empty_translations: true

    image_accessor :slide_image if respond_to?(:image_accessor)

    class Translation
      attr_accessible :title, :body, :slide_image, :video_url
    end

    def video
      @video ||= UnvlogIt.new(video_url) unless video_url.nil? rescue nil
    end

  end
end
