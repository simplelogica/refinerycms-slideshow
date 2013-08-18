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
        let(:example_slideshow) { attached_page.example_slideshow }
        let(:not_attached_slideshow) { create :slideshow }

        before {

          Refinery::Page.class_eval do
            include Refinery::Slideshow::Concerns::ModelWithSlideShow
            attach_slideshow :example_slideshow
          end

          attached_slideshow && not_attached_slideshow
        }

        it("should filter not attached ones") { Slideshow.not_attached.should match_array [not_attached_slideshow] }
        it("should assign the slideshow to the attached object") { attached_page.slideshows.should match_array [attached_slideshow, example_slideshow] }
        it("should create the example slideshow ") { attached_page.example_slideshow.should_not be_nil }

      end

    end
  end
end
