lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'battletoads/version'

Gem::Specification.new do |s|
  s.name        = 'battletoads'
  s.version     = Battletoads::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['gazay']
  s.licenses    = ['MIT']
  s.email       = ['alex.gaziev@gmail.com']
  s.homepage    = 'https://github.com/gazay/battletoads'
  s.summary     = %q{Tooling for generate demo applications with PostCSS plugins}
  s.description = %q{Tooling for generate demo applications with PostCSS plugins. Right now only gulp applications}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.required_ruby_version = '> 2.2.0'
  s.add_dependency 'psych'
  s.add_development_dependency 'rspec', '>= 3.0'
end
