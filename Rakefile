require 'rubygems'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

desc 'Run all examples'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

task :default => [:spec]
