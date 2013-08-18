module Refinery::Slideshow::Concerns::ModelWithSlideShow

  extend ActiveSupport::Concern

  included do

    has_many :slideshows, class_name: "Refinery::Slideshow::Slideshow", as: :attached

  end

end
