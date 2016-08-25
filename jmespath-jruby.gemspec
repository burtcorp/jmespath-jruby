# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)

require 'jmespath/version'

Gem::Specification.new do |s|
  s.name = 'jmespath-java'
  s.version = JmesPath::VERSION
  s.author = 'Theo Hultberg'
  s.email = 'theo@burtcorp.com'
  s.summary = 'JMESPath implementation for JRuby'
  s.description = 'Fully compliant JMESPath implementation for JRuby based on jmespath-java'
  s.platform = 'java'

  s.files = Dir['lib/**/*.rb', 'lib/**/*.jar', 'README.md']
end
