# encoding: utf-8

require 'jmespath/ext/antlr4-runtime-4.5.1.jar'
require 'jmespath/ext/jmespath-core-0.1.0.jar'
require 'jmespath/ext/jmespath.jar'

Java::IoBurtJmespathJruby::JmesPathLibrary.new.load(JRuby.runtime, false)

JMESPath = JmesPath

require 'jmespath/version'
