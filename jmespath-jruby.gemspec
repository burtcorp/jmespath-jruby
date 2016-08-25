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

  s.files << Dir[ 'lib/**/*.rb' ]
  s.files << 'lib/example.jar'
  s.files << Dir[ '*file' ]
  s.files << 'example.gemspec'

  s.requirements << 'jar io.burt:jmespath-core, 0.1.0'
  s.requirements << 'jar org.jruby:jruby, 1.7.25, :scope => :provided'
  s.requirements << 'jar junit:junit:4.12, :scope => :test'
end
