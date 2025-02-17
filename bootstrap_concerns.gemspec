Gem::Specification.new do |s|
  s.add_dependency "actionview", "~> 8"
  s.add_development_dependency "rspec", "~> 3"
  s.add_development_dependency "standard", "~> 1"
  s.authors = [
    "Evan Brooks",
    "Robert Keresnyei"
  ]
  s.files = [
    "lib/bootstrap_concerns.rb",
    "lib/bootstrap_concerns/components_helper.rb",
    "lib/bootstrap_concerns/form_builder.rb",
    "lib/bootstrap_concerns/option.rb"
  ]
  s.homepage = "https://github.com/swiftvee/bootstrap_concerns"
  s.license = "MIT"
  s.name = "bootstrap_concerns"
  s.required_ruby_version = ">= 3.4.0"
  s.summary = "Concerns for building Bootstrap components with Ruby on Rails."
  s.version = "0.3.0"
end
