require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

Rake::Task["release"].enhance do
  spec = Gem::Specification::load(Dir.glob("*.gemspec").first)
  sh "gem build pkg/#{spec.name}-#{spec.version}.gem"
  sh "gem push pkg/#{spec.name}-#{spec.version}.gem"
end
