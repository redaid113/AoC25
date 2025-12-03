require_relative "../utils/part"

module Day3
  class Part1 < Part
    def call
      result = @batteries.map(&method(:largest_joltage)).sum
      puts "Result: #{result}"
    end

    def largest_joltage(battery)
      max = 0
      (0..battery.length-1).each do |i|
        (i+1..battery.length-1).each do |j|
          max = [max, battery[i]*10 + battery[j]].max
        end
      end
      max
    end

    def parse_input
      @batteries = @file_lines.map{|line|line.chars.map(&:to_i)}
    end
  end
end
