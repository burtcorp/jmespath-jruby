# encoding: utf-8

require 'jmespath/ext/jmespath.jar'

Java::IoBurtJmespathJruby::JmesPathLibrary.new.load(JRuby.runtime, false)

JMESPath = JmesPath

require 'jmespath/version'
