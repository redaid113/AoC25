require_relative "../utils/part"

module Day2
  class Part2 < Part
    def call
      invalid = []

      @ranges.each do |(r1, r2)|
        invalid += (r1..r2).select{|n| !valid?(n)}
      end

      result = invalid.sum
      puts "Result: #{result}"
    end

    def valid?(n)
      str = n.to_s.chars
      (1..str.length/2).each do |len|
        return false if str.each_slice(len).uniq.size == 1
      end
      true
    end

    def parse_input
      @ranges = @input.split(",").map{|r|r.split("-").map(&:to_i)}
    end
  end
end
