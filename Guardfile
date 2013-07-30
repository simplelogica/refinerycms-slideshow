# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch(%r{spec/support/(.+).rb}) { :rspec }
  watch(%r{^app/models/.+\.rb$}) { :rspec }
  watch(%r{^app/decorators/.+\.rb$}) { :rspec }
  watch(%r{^app/controllers/.+\.rb$}) { :rspec }
  watch(%r{^lib/refinery/ue_core/importations/(.+)\.rb$})     { :rspec }
  watch(%r{^lib/refinery/ue_core/(.+)\.rb$})     { :rspec }
end

guard 'rspec', :cli => "--color --format nested --fail-fast --drb", :run_all => { :cli => "-p --color" }, :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }

  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara features specs
  watch(%r{^app/views/((.+)/)+.*\.(erb|haml)$})          { |m| Dir[File.join("spec/requests/#{m[1]}/*_spec.rb")]  }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }


  watch(%r{^lib/refinery/ue_core/importations/(.+)\.rb$}) { |m| "spec/importations/#{m[1]}_spec.rb" }
  watch(%r{^lib/refinery/ue_core/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }

end
