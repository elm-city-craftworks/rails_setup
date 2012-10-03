namespace :setup do
  desc "It's the awesome part of the sauce"
  setup_task :awesome_sauce => :environment do
    puts 100.times.map { heart }.join
  end
end

desc "Setup"
setup_task :setup do
  done "Making things excellent"
end