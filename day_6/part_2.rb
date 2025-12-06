require_relative "../utils/part"

module Day6
  class Part2 < Part
    def call
      result = @numbers.each_with_index.sum{|l, i| l.reduce(@operations[i])}
      puts "Result: #{result}"
    end

    def parse_input
      @operations = @file_lines.pop.split(" ").compact.map(&:to_sym)
      list = @file_lines.map{|line| line.split("")}.transpose.map{|line| line.join("").split(" ").compact.map(&:to_i)}
      @numbers = []
      nums = []
      list.each do |arr|
        if arr.length == 0
          @numbers << nums
          nums = []
        else
          nums << arr[0]
        end
      end
      @numbers << nums
    end
  end
end
