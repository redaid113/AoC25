require_relative "../utils/part"
require "set";

module Day10
  class Part2 < Part
    def call
      result = @lines.sum(&method(:min_presses))
      puts "Result: #{result}"
    end

    def min_presses(line)
      # use z3
    end

    def parse_input
      @lines = @file_lines.map do |line|
        line = line.gsub("[", "").gsub("]", "").gsub("(", "").gsub(")", "").gsub("{", "").gsub("}", "")
        bits = line.split(" ")
        goal = bits.shift.split("").map{|b| b == "#"}
        bits.map!{|b| b.split(",").map(&:to_i)}
        voltage = bits.pop
        [goal, bits, voltage]
      end
    end
  end
end
