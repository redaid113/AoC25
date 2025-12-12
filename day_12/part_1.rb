require_relative "../utils/part"

module Day12
  class Part1 < Part
    def call
      result = @spaces.select do |(size, cts)|
        area = size.inject(:*)
        shape_area = cts.each_with_index.sum{|ct, i| ct * @shapes[i] }
        area >= shape_area
      end.length
      puts "Result: #{result}"
    end

    def parse_input
      @spaces = @paragraphs.pop().split("\n").map do |line|
        size, numbers = line.split(": ")
        [size.split("x").map(&:to_i), numbers.split(" ").map(&:to_i)]
      end

      @shapes = @paragraphs.map do |paragraph|
        bits = paragraph.split("\n")
        bits.shift()
        shape = bits.map{|l| l.split("")}
        area = shape.map{|l| l.select{|c| c== "#" }.length}.sum
        area
      end
    end
  end
end
