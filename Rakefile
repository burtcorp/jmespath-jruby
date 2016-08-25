# encoding: utf-8

require 'bundler/setup'
require 'jars/classpath'
require 'jars/installer'
require 'rake/javaextensiontask'
require 'rspec/core/rake_task'
require 'rubygems/package_task'

desc 'Compiles extension and run specs'
task :default => [:compile, :spec]

gemspec = eval(File.read('jmespath-jruby.gemspec'))

desc 'Compile the Java extension'
Rake::JavaExtensionTask.new('jmespath', gemspec) do |ext|
  ext.classpath = Jars::Classpath.new.classpath_string
  ext.source_version = '1.7'
  ext.target_version = '1.7'
  ext.ext_dir = 'ext/src/main/java'
end

task :compile do
  ext_dir = 'lib/jmespath/ext'
  FileUtils.mkdir_p(ext_dir)
  FileUtils.mv('lib/jmespath.jar', ext_dir)
  Jars::Classpath.new.classpath.each do |path|
    FileUtils.cp(path, File.join(ext_dir, File.basename(path)))
  end
end

Gem::PackageTask.new(gemspec) do
  desc 'Package gem'
  task :package => [:install_jars, :compile]
end

desc 'Run specs'
RSpec::Core::RakeTask.new

task :spec => :compile

task :default => :spec
