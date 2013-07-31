class AddTranslationToSlide < ActiveRecord::Migration
  def change
    create_table Refinery::Slideshow::Slide::Translation.table_name do |t|
      t.belongs_to Refinery::Slideshow::Slide.table_name.singularize

      t.string :title
      t.text :body
      t.string :slide_image_uid
      t.string :slide_image_name
      t.string :video_url

      t.string :locale
      t.timestamps
    end
  end
end
