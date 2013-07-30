class Refinery::Slideshow::Slideshow < ActiveRecord::Base
  attr_accessible :uid

  validates :uid, presence: true
  validates :uid, uniqueness: true
end
