require 'envi/process'

module Envi
  class Dsl
    attr_reader :processes

    class << self
      def parse(envirc_path='.envirc')
        dsl = Dsl.new
        dsl.instance_eval(read_envirc(envirc_path))
        dsl
      end

      def read_envirc(envirc_path)
        File.read(envirc_path)
      end
    end

    def initialize
      @processes = {}
    end

    def run name, command
      @processes[name.to_s] = Envi::Process.new(name, command)
    end
  end
end
