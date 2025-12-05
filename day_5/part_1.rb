require_relative "../utils/part"

module Day5
  class Part1 < Part
    def call
      result = @ids.count(&method(:fresh?))
      puts "Result: #{result}"
    end

    def fresh?(id)
      @ranges.any?{|(x, y)| x <= id && id <= y}
    end

    def parse_input
      @ranges = @paragraphs[0].split("\n").map{|s| s.split("-").map(&:to_i)}
      @ids = @paragraphs[1].split("\n").map(&:to_i)
    end
  end
end
