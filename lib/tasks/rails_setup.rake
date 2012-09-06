def setup_task(name)
  task name => [:setup_environment] do
    yield
  end
end

task :setup_environment do
  include RailsSetup::Environment
end