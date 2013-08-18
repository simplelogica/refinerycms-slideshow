class Refinery::Slideshow::Slideshow < ActiveRecord::Base
  attr_accessible :uid

  has_many :slides
  belongs_to :attached, polymorphic: true

  validates :uid, presence: true
  validates :uid, uniqueness: true


  scope :not_attached, ->() { where(attached_type: nil, attached_id: nil) }

  before_save :uid_for_attached_slideshows

  def uid_for_attached_slideshows
    self.uid = "#{self.attached.class.name}(#{self.attached.id})" unless self.attached.nil?
  end

  # Needed for the dashboard's activity list
  def title
    uid
  end

end
