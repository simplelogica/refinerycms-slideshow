class AddPositionToSlide < ActiveRecord::Migration
  def change
    add_column Refinery::Slideshow::Slide.table_name, :position, :integer
  end
end
