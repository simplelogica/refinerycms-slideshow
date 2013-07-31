# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slide, class: Refinery::Slideshow::Slide do
    slideshow
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    video_url { 'http://www.youtube.com/watch?v=frGLMtGsotc' } # Not pony tales or cotton tales! No! Ducktales!
  end
end
