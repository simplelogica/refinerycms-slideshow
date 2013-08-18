class AddExampleSlideshowToPage < ActiveRecord::Migration
  def change
    add_column Refinery::Page.table_name, :example_slideshow_id, :integer
  end
end
