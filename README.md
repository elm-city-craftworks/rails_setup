# Rails Setup

Make it easier for developers to get your rails app up and running with a little
help from Rails Setup. Rails Setup adds a few handy rake tasks which will
empower you to create a `rake setup` task that looks like this:

```ruby
desc "Setup my awesome app"
setup_task :setup do
  puts "#{heart} Thanks for helping us out!" # Show developers you <3 them

  section "Database" do # Outputs a nice looking header
    silence do          # Hide noisy output from other rake tasks
      Rake::Task["db:setup"].invoke
    end

    done "Database" # Display a nice checkbox so developers know you are done
  end

  section "Use Highline" do
    if console.agree("Isn't this really cool?")
      puts 100.times.map { heart }.join
    end
  end
end
```

and outputs prompts like this:

![rake setup in action](http://i.imgur.com/WWqW5.png)

## Usage

Add this to your app's `Gemfile`

```ruby
gem 'rails_setup'
```

Then create a new file in `lib/tasks` called `setup.rake` with some small
boilerplate code

```ruby
desc "Setup this application"
setup_task :setup do
  puts "#{heart} Thanks for helping us out!" # Show developers you <3 them

  # Do all your setup tasks (create secret_token / database.yml, etc) here.
end
```

## Contributing

Features and bugs are tracked through Github Issues.

Contributors retain copyright to their work but must agree to release their
contributions under the same terms as this project. For details, please see the
LICENSE file.

If you would like to help with developing Rails Setup, please get in touch!
Contact Jordan through GitHub (@jordanbyron) or Twitter (@jordan_byron).