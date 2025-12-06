require_relative "../utils/part"

module Day6
  class Part1 < Part
    def call
      result = @numbers.each_with_index.sum{|l, i| l.reduce(@operations[i])}
      puts "Result: #{result}"
    end

    def parse_input
      @operations = @file_lines.pop.split(" ").compact.map(&:to_sym)
      @numbers = @file_lines.map{|line| line.split(" ").compact.map(&:to_i)}.transpose
    end
  end
end
