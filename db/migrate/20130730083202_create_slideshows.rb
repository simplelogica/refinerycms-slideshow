class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table Refinery::Slideshow::Slideshow.table_name do |t|
      t.string :uid

      t.timestamps
    end
  end
end
