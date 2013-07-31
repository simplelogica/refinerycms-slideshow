class CreateSlides < ActiveRecord::Migration
  def change
    create_table Refinery::Slideshow::Slide.table_name do |t|
      t.belongs_to :slideshow

      t.timestamps
    end
    add_index Refinery::Slideshow::Slide.table_name, :slideshow_id
  end
end
