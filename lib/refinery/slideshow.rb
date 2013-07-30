require 'refinerycms-core'

module Refinery

  module Slideshow
    require 'refinery/slideshow/engine'
    attr_writer :root

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end
