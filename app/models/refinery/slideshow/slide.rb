class Refinery::Slideshow::Slide < ActiveRecord::Base
  belongs_to :slideshow, class_name: "Refinery::Slideshow::Slideshow"
end
