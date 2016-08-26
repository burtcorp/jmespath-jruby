require 'jmespath/ext/jmespath.jar'

Java::IoBurtJmespathJruby::JmesPathLibrary.new.load(JRuby.runtime, false)

unless defined? JMESPath
  JMESPath = JmesPath
end

require 'jmespath/version'
