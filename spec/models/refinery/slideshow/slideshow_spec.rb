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
        let(:not_attached_slideshow) { create :slideshow }

        before {
          attached_slideshow && not_attached_slideshow
        }

        it("should filter not attached ones") { Slideshow.not_attached.should match_array [not_attached_slideshow] }

      end

    end
  end
end
