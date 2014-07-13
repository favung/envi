require 'thor'
require 'envi/version'
require 'envi/dsl'

module Envi
  class CLI < Thor
    default_task :start

    desc "start", "Starts envi"
    def start(process_name)
      dsl = Dsl.parse
      dsl.processes[process_name].start
    end

    desc :stop, "Stop process"
    def stop(process_name)
      dsl = Dsl.parse
      dsl.processes[process_name].stop
    end

    desc :init, "Initialize"
    def init
      puts "Initialize"
      FileUtils.mkdir("#{ENV['HOME']}/.envi")
    end

    desc :status, "Running processes"
    def status
      pids_pattern = "#{ENV['HOME']}/.envi/*.pid"
      Dir[pids_pattern].each do |pid_file|
        puts File.basename(pid_file)
      end
    end

    desc :log, "Log"
    def log(process_name)
      dsl = Dsl.parse('.envirc')
      puts dsl.processes[process_name].log
    end
  end
end
