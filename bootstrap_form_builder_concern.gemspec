Gem::Specification.new do |s|
  s.add_dependency "actionview", ">= 8.0.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "standard"
  s.authors = ["Evan Brooks", "Robert Keresnyei"]
  s.files = ["lib/bootstrap_form_builder_concern.rb", "lib/bootstrap_form_builder_concern/bootstrap_options.rb"]
  s.homepage = "https://github.com/swiftvee/bootstrap_form_builder_concern"
  s.license = "MIT"
  s.name = "bootstrap_form_builder_concern"
  s.required_ruby_version = ">= 3.4.0"
  s.summary = "A concern for Rails form builders to generate Bootstrap forms."
  s.version = "1.0.1"
end
