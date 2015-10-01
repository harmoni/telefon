require_relative "lib/telefon/version"

Gem::Specification.new do |s|
  s.name        = "telefon"
  s.version     = Telefon::VERSION
  s.summary     = "Formats a number into a US phone number (e.g: (555) 123-9876)."
  s.description = s.summary
  s.authors     = ["Mayn Ektvedt Kjær"]
  s.email       = ["mayn.kjaer@gmail.com"]
  s.homepage    = "https://github.com/harmoni/telefon"
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_development_dependency "cutest", "~> 1.2"
end
