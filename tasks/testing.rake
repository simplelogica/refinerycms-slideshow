namespace :refinery do
  namespace :testing do
    # Put any code in here that you want run when you test this extension against a dummy app.
    # For example, the call to require your gem and start your generator.
    task :setup_extension do
      # We need a migration to attach an slideshow to the page
      FileUtils.cp "../fixtures/db/migrate/20130818172211_add_example_slideshow_to_page.rb", "db/migrate/#{Time.now.strftime('%Y%m%d%H%M%s')}_add_example_slideshow_to_page.rb"

      `rake db:migrate RAILS_ENV=test`
    end
  end
end
