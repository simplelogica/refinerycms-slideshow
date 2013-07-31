class Refinery::Slideshow::Slideshow < ActiveRecord::Base
  attr_accessible :uid

  has_many :slides

  validates :uid, presence: true
  validates :uid, uniqueness: true
end
