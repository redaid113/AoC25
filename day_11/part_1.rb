require_relative "../utils/part"

module Day11
  class Part1 < Part
    def call
      result = paths("you")
      puts "Result: #{result}"
    end

    def paths(a)
      return 1 if a == "out"
      @connections[a].sum{|b| paths(b)}
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
