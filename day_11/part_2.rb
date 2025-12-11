require_relative "../utils/part"

module Day11
  class Part2 < Part
    def call
      result = paths("svr")
      puts "Result: #{result}"
    end

    def paths(a, dac=false, fft=false)
      @paths ||= {}
      @paths[[a, dac, fft]] ||= _paths(a, dac, fft)
    end

    def _paths(a, dac=false, fft=false)
      return 1 if a == "out" && dac && fft
      return 0 if a == "out"
      dac = true if a == "dac"
      fft = true if a == "fft"
      @connections[a].sum{|b| paths(b, dac, fft)}
    end

    def parse_input
      @connections = {}
      @file_lines.map do |line|
        a, b = line.split(": ")
        @connections[a] = b.split(" ")
      end
    end
  end
end
