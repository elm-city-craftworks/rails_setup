require 'fileutils'
require 'rainbow'
require 'highline'

module RailsSetup
  module Environment

    def console
      @console ||= HighLine.new
    end

    def checkmark
      "\u2713 ".color(:green)
    end

    def heart
      "\u2665 ".color(:red)
    end

    def done(message)
      puts "#{checkmark} #{message}"
    end

    def section(description)
      puts # Empty Line
      puts description.underline
      puts # Empty Line
      yield
    end

    def silence
      begin
        orig_stderr = $stderr.clone
        orig_stdout = $stdout.clone

        $stderr.reopen File.new('/dev/null', 'w')
        $stdout.reopen File.new('/dev/null', 'w')

        return_value = yield
      rescue Exception => e
        $stdout.reopen orig_stdout
        $stderr.reopen orig_stderr
        raise e
      ensure
        $stdout.reopen orig_stdout
        $stderr.reopen orig_stderr
      end

      return_value
    end

    # Creates a file based on a '.example' version saved in the same folder
    # Will optionally open the new file in the default editor after creation
    #
    def create_file(file, name, requires_edit=false)
      FileUtils.cp(file + '.example', file)

      if requires_edit
        puts "Update #{file} and run `bundle exec rake setup` to continue".color(:red)
        system(ENV['EDITOR'], file) unless ENV['EDITOR'].blank?
        exit
      end
    end

    # Looks for the specificed file and creates it if it does not exist
    #
    def find_or_create_file(file, name, requires_edit=false)
      if File.exists?(file)
        file
      else
        create_file(file, name, requires_edit)
      end
    end
  end
end
