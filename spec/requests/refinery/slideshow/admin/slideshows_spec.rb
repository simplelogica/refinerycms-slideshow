# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "UeCore" do
    describe "Admin" do
      describe "slideshows" do

        it_behaves_like "model with admin" do

          let(:i18n_plural_key) { 'slideshows' }
          let(:admin_index_path) { refinery.slideshow_admin_slideshows_path }
          let(:model_factory) { :slideshow }
          let(:model_name_attribute) { :uid }
          let(:model_class) { Refinery::Slideshow::Slideshow }
          let(:row_prefix) { "slideshow" }

        end


      end
    end
  end
end
