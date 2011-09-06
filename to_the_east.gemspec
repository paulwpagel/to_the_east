$:.push File.expand_path("../lib", __FILE__)
require "east/version"

Gem::Specification.new do |s|
  s.name        = "east"
  s.version     = East::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paul Pagel"]
  s.homepage    = "http://github.com/paulwpagel/instant_quote_client"
  s.email       = "paul@8thlight.com"
  s.summary     = "A Journey To The East"
  s.description = "A Rails data migration tool"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

end
