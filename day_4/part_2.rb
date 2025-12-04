require_relative "../utils/part"

module Day4
  class Part2 < Part
    def call
      result = 0
      prev = -1
      while prev != result
        prev = result
        @rolls.each_with_index do |_, r|
          @rolls[r].each_with_index do |roll, c|
            next unless roll == "@"
            next unless rolls_around(r, c) < 4
            result += 1
            @rolls[r][c] = "."
          end
        end
      end

      puts "Result: #{result}"
    end

    def rolls_around(r, c)
      neighbours(r, c).count{|(r, c)| @rolls[r][c] == "@"}
    end

    def neighbours(r, c)
      [
        [-1, -1],
        [-1, 0],
        [-1, 1],
        [0, -1],
        [0, 1],
        [1, -1],
        [1, 0],
        [1, 1],
      ].map{|(dr, dc)| [r+dr, c+dc]}
      .select{|(nr, nc)| nr >= 0 && nr < @rolls.length && nc >= 0 && nc < @rolls[0].length }
    end

    def parse_input
      @rolls = @file_lines.map{|line| line.chars}
    end
  end
end
