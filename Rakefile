require 'bundler'
Bundler::GemHelper.install_tasks

task :default => :spec
task :test => :spec

desc 'run Rspec specs'
task :spec do
  sh 'rspec spec'
end

require 'yard'
namespace :doc do
  YARD::Rake::YardocTask.new do |task|
    task.files   = ['LICENSE.md', 'lib/**/*.rb']
    task.options = ['--markup', 'markdown']
  end
end
