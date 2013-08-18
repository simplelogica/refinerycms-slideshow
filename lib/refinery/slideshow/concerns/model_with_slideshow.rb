module Refinery::Slideshow::Concerns::ModelWithSlideShow

  extend ActiveSupport::Concern

  included do

    has_many :slideshows, class_name: "Refinery::Slideshow::Slideshow", as: :attached

  end

  module ClassMethods

    def attach_slideshow slideshow_relationship_name

      # We create the relationship
      belongs_to slideshow_relationship_name, class_name: "Refinery::Slideshow::Slideshow", autosave: true

      # In slideshow assignation we should attach current object to the slideshow
      define_method "#{slideshow_relationship_name}=" do |slideshow|
        slideshow.attached = self
        super(slideshow)
      end

      # Before saving we must check if this new slideshow has been created and create it otherwise
      before_save do |record|
        if record.send(slideshow_relationship_name).nil?
          record.send "build_#{slideshow_relationship_name}", attached: record
        else
          record.send(slideshow_relationship_name).attached = record
        end
        record.send(slideshow_relationship_name).save!
      end
    end

  end

end
