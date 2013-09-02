module Refinery::Slideshow::Concerns::ModelWithSlideShow

  extend ActiveSupport::Concern

  included do

    has_many :slideshows, class_name: "Refinery::Slideshow::Slideshow", as: :attached

  end

  module ClassMethods

    def attach_slideshow slideshow_relationship_name

      # We create the relationship
      belongs_to slideshow_relationship_name, class_name: "Refinery::Slideshow::Slideshow", autosave: true

      # We create a method to define if this object needs an slideshow. By default it needs it.
      define_method "needs_#{slideshow_relationship_name}?" do
        true
      end

      # In slideshow accesor we check if this record has no slideshow but should have it, then we create a new slideshow
      define_method "#{slideshow_relationship_name}" do

        # We try to get the slideshow using the relationship
        local_slideshow = self[slideshow_relationship_name.to_sym]

        # If slideshow is nil, and the object has been already saved and the object needs an slideshow then we create it
        if local_slideshow.nil? && !self.new_record? && self.send("needs_#{slideshow_relationship_name}?")
          local_slideshow = self.send("build_#{slideshow_relationship_name}", attached: self)
          self[slideshow_relationship_name.to_sym] = local_slideshow
          send "#{slideshow_relationship_name}=", local_slideshow
          self.save
        end

        local_slideshow

      end

      # In slideshow assignation we should attach current object to the slideshow
      define_method "#{slideshow_relationship_name}=" do |slideshow|
        slideshow.attached = self
        super(slideshow)
      end

      # Before saving we must check if this new slideshow has been created and create it otherwise
      after_save do |record|
        if self.send("needs_#{slideshow_relationship_name}?")
          record.send(slideshow_relationship_name).nil?
        end
      end
    end

  end

end
