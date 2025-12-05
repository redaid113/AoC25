require_relative "../utils/part"

module Day5
  class Part2 < Part
    def call
      result = compress_ranges().sum{|(x, y)| y-x+1}
      puts "Result: #{result}"
    end

    def compress_ranges()
      @ranges.sort_by!{|(x, y)| x }
      compressed = [@ranges[0]]
      @ranges.each do |c|
        r = compressed.last
        if r[0] <= c[0] && c[0] <= r[1]
          compressed.pop
          compressed << [(r + c).min, (r + c).max]
        else
          compressed << c
        end
      end
      compressed
    end

    def parse_input
      @ranges = @paragraphs[0].split("\n").map{|s| s.split("-").map(&:to_i)}
      @ids = @paragraphs[1].split("\n").map(&:to_i)
    end
  end
end
