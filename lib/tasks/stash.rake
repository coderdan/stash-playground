require 'open3'

def stash(cmd)
  Open3.popen3("stash #{cmd}") do |stdin, stdout, stderr|
    puts stdout.read
  end
end

namespace :stash do
  desc "List stash collections"
  task :login, [:workspace] do |task, args|
    # TODO: Check for workspace
    stash("login #{args[:workspace]}")
  end
  task :list do
    stash("list-collections")
  end
  task :workspace do
  end
end
