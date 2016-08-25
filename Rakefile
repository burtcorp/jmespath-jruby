# encoding: utf-8

require 'bundler/setup'
require 'rspec/core/rake_task'

namespace :extension do
  task :package do
    Dir.chdir('ext') do
      sh 'mvn package'
    end
  end

  task :install => :package do
    extension_jar = Dir['ext/target/jmespath-jruby-*-jar-with-dependencies.jar'].max
    extension_dir = 'lib/jmespath/ext'
    FileUtils.mkdir_p(extension_dir)
    FileUtils.cp(extension_jar, extension_dir)
  end
end

desc 'Run specs'
RSpec::Core::RakeTask.new

task :spec => 'extension:install'

task :default => :spec
