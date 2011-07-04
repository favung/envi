module Envi
  class Process
    attr_reader :name
    attr_reader :command

    def initialize name, command
      @name = name
      @command = command
    end

    def start
      if running?
        puts "Application #{name} is already running!"
        return
      end

      pid = ::Process.spawn(command, pgroup: 0, out: log_file_name)

      File.open(pid_file_name, 'w') do |f|
        f.puts(pid)
      end
    end

    def stop
      if running?
        pid = File.read(pid_file_name).to_i
        puts "Stopping #{name} ..."
        ::Process.kill(-2, pid)
        FileUtils.rm(pid_file_name)
      else
        puts "Application #{name} is not running."
      end
    end

    def log
      File.read(log_file_name)
    end

    def running?
      File.exists?(pid_file_name)
    end

    def log_file_name
      File.join(envi_path, "#{name}.log")
    end

    def pid_file_name
      File.join(envi_path, "#{name}.pid")
    end

    def envi_path
      "#{ENV['HOME']}/.envi"
    end
  end
end
