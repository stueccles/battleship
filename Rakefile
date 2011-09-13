require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "players"
  t.test_files = FileList['test/*_player_test.rb']
  t.verbose = true
end

task :default => :test
