require_relative "../utils/part"

module Day7
  class Part1 < Part
    def call
      result = beams(@start[0], @start[1])
      puts "Result: #{result}"
    end

    def beams(r, c)
      @beams ||= {}
      return 0 if @beams[[r, c]]
      @beams[[r, c]] ||= _beams(r, c)
    end

    def _beams(r, c)
      return 0 if r < 0 || c < 0 || r >= @grid.length || c >= @grid[r].length
      return beams(r + 1, c) if @grid[r][c] != "^"
      1 + beams(r, c - 1) + beams(r + 1, c + 1)
    end

    def parse_input
      @grid = @file_lines.map{|line| line.split("")}
      @grid.each_with_index do |row, r|
        row.each_with_index do |val, c|
          @start = [r, c] if val == "S"
        end
      end
    end
  end
end
