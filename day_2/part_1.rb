require_relative "../utils/part"

module Day2
  class Part1 < Part
    def call
      invalid = []

      @ranges.each do |(r1, r2)|
        invalid += (r1..r2).select{|n| !valid?(n)}
      end

      result = invalid.sum
      puts "Result: #{result}"
    end

    def valid?(n)
      str = n.to_s
      str.length % 2 == 1 || str[0..str.length/2-1] != str[str.length/2..-1]
    end

    def parse_input
      @ranges = @input.split(",").map{|r|r.split("-").map(&:to_i)}
    end
  end
end
