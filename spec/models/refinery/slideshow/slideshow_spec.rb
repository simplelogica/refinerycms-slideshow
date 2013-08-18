require 'spec_helper'


module Refinery
  module Slideshow
    describe Slideshow do
      it_behaves_like "model with attributes", :slideshow
      it_behaves_like "model with uniq attributes", :slideshow, [:uid]
      it_behaves_like "model with required attributes", :slideshow, [:uid]
      it_behaves_like "model with has many relationship", :slideshow, :slide, :slides, :slideshow

      context "attaching" do

        let(:attached_slideshow) { create :slideshow, :attached }
        let(:attached_page) { attached_slideshow.attached }
        let(:not_attached_slideshow) { create :slideshow }

        before {

          Refinery::Page.class_eval do
            include Refinery::Slideshow::Concerns::ModelWithSlideShow
          end

          attached_slideshow && not_attached_slideshow
        }

        it("should filter not attached ones") { Slideshow.not_attached.should match_array [not_attached_slideshow] }

        it("should assign uid from attached object") { attached_slideshow.uid.should eql "#{attached_page.class.name}(#{attached_page.id})" }
        it("should assign the slideshow to the attached object") { attached_page.slideshows.should match_array [attached_slideshow] }

      end

    end
  end
end
