require_relative "../utils/part"

module Day3
  class Part2 < Part
    def call
      result = @batteries.map(&method(:largest_joltage)).sum
      puts "Result: #{result}"
    end

    def largest_joltage(battery, len=12)
      last = 0
      max = []
      (1..len).each do |i|
        bits = battery[last..battery.length-len+i-1]
        max << bits.max
        last = last + bits.index(max.last) + 1
      end
      max.join("").to_i
    end

    def parse_input
      @batteries = @file_lines.map{|line|line.chars.map(&:to_i)}
    end
  end
end
