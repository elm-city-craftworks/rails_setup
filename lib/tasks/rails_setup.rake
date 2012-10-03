def setup_task(options)
  name = options
  env  = [:setup_environment]

  if Hash === options
    name = options.keys.first
    env += options.values.flatten
  end

  task name => env do
    yield
  end
end

task :setup_environment do
  include RailsSetup::Environment
end