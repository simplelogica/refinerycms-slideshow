# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slideshow, class: Refinery::Slideshow::Slideshow do
    uid { Faker::Lorem.words(4).join '-' }

    trait :attached do
      attached { FactoryGirl.create :page }
    end
  end
end
