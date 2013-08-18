class AddAttachedToSlideshow < ActiveRecord::Migration
  def change
    add_column Refinery::Slideshow::Slideshow.table_name, :attached_type, :string
    add_column Refinery::Slideshow::Slideshow.table_name, :attached_id, :integer
  end
end
