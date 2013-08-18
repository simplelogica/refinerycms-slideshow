class Refinery::Slideshow::Slideshow < ActiveRecord::Base
  attr_accessible :uid

  has_many :slides
  belongs_to :attached, polymorphic: true

  validate :uid_not_blank_if_not_attached

  def uid_not_blank_if_not_attached
    errors.add(:uid, :blank) if self.uid.blank? && self.attached.nil?
    errors.add(:uid, :taken) if self.attached.nil? && !self.class.where(uid: uid).empty?
  end


  scope :not_attached, ->() { where(attached_type: nil, attached_id: nil) }


  # Needed for the dashboard's activity list
  def title
    uid
  end

end
