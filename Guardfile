guard :rspec, cmd: "bundle exec rspec -f doc --color" do
  # run every updated spec file
  watch(%r{^spec/.+_spec\.rb$})
  # run the lib specs when a file in lib/ changes
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  # run the model specs related to the changed model
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  # run the view specs related to the changed view
  watch(%r{^app/(.*)(\.erb|\.haml)$}) { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # run the integration specs related to the changed facades
  watch(%r{^app/facades/(.+)\.rb}) { |m| "spec/facades/#{m[1]}_spec.rb" }
  # run the integration specs related to the changed controller
  watch(%r{^app/controllers/(.+)\.rb}) { |m| "spec/requests/#{m[1]}_spec.rb" }
  # run all integration tests when application controller change
  watch('app/controllers/application_controller.rb') { "spec/requests" }
end

