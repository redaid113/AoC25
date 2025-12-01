require_relative "../utils/part"

module Day1
  class Part2 < Part
    def call
      result = 0
      cur = 50

      @moves.each do |(dir, dist)|
        dist.times do
          cur += dir == "R" ? 1 : -1
          cur %= 100
          result += 1 if cur == 0
        end
      end
      puts "Result: #{result}"
    end

    def parse_input
      @moves = @file_lines.map{|line| [line[0], line[1..-1].to_i]}
    end
  end
end
