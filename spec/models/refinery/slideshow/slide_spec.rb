require 'spec_helper'


module Refinery
  module Slideshow
    describe Slide do
      it_behaves_like "model with attributes", :slide
    end
  end
end
