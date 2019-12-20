require 'bundler/setup'
Bundler::GemHelper.install_tasks

Dir.glob('lib/tasks/*.rake').each { |task| load task }

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test" << "lib"
  t.pattern = "test/**/*_test.rb"
end

task(default: :test)
