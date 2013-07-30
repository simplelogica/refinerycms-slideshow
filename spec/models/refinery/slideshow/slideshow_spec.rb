require 'spec_helper'


module Refinery
  module Slideshow
    describe Slideshow do
      it_behaves_like "model with attributes", :slideshow
      it_behaves_like "model with uniq attributes", :slideshow, [:uid]
      it_behaves_like "model with required attributes", :slideshow, [:uid]
      it_behaves_like "model with has many relationship", :slideshow, :slide, :slides, :slideshow
    end
  end
end
