Gem::Specification.new do |s|
  s.add_dependency "actionview", ">= 8.0.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "standard"
  s.authors = [
    "Evan Brooks",
    "Robert Keresnyei"
  ]
  s.files = [
    "lib/bootstrap_concerns/button_helper.rb",
    "lib/bootstrap_concerns/form_builder.rb",
    "lib/bootstrap_concerns/option.rb"
  ]
  s.homepage = "https://github.com/swiftvee/bootstrap_form_builder_concern"
  s.license = "MIT"
  s.name = "bootstrap_concerns"
  s.required_ruby_version = ">= 3.4.0"
  s.summary = "Concerns for building Bootstrap components with Ruby on Rails."
  s.version = "0.1.0"
end
