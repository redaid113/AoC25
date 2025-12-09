require_relative "../utils/part"

module Day9
  class Part2 < Part
    def call
      result =  @points.combination(2).map{|(a, b)| [a, b, ((a[0] - b[0]).abs + 1) * ((a[1] - b[1]).abs + 1)]}.sort_by{|(_, _, dist)| -dist}.find{|(a, b)| valid?(a, b)}

      puts "Result: #{result[2]}"
    end

    def valid?(p1, p2)
      r1, r2 = [p1[0], p2[0]].sort
      c1, c2 = [p1[1], p2[1]].sort

      !@edges.any?{|rs, cs| r1 < rs[1] && r2 > rs[0] && c1 <  cs[1] && c2 > cs[0] }
    end

    def parse_input
      @points = @file_lines.map{|line| line.split(",").map(&:to_i)}
      @edges = []

      @points.each_with_index do |p1, i|
        p2 = @points[(i + 1) % @points.length]
        r = [p1[0], p2[0]].sort
        c = [p1[1], p2[1]].sort

        @edges << [r, c]
      end
    end
  end
end
