class Refinery::Slideshow::Slideshow < ActiveRecord::Base
  attr_accessible :uid

  has_many :slides

  validates :uid, presence: true
  validates :uid, uniqueness: true

  belongs_to :attached, polymorphic: true

  scope :not_attached, ->() { where(attached_type: nil, attached_id: nil) }

  # Needed for the dashboard's activity list
  def title
    uid
  end

end
