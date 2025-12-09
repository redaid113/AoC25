require_relative "../utils/part"

module Day9
  class Part1 < Part
    def call
      result = @points.combination(2).map{|(a, b)| ((a[0] - b[0]).abs + 1) * ((a[1] - b[1]).abs + 1)}.max
      puts "Result: #{result}"
    end

    def parse_input
      @points = @file_lines.map{|line| line.split(",").map(&:to_i)}
    end
  end
end
