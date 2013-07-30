# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slide, class: Refinery::Slideshow::Slide do
    slideshow
  end
end
