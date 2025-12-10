require_relative "../utils/part"
require "set";

module Day10
  class Part1 < Part
    def call
      result = @lines.sum(&method(:min_presses))
      puts "Result: #{result}"
    end

    def min_presses(line)
      goal, buttons, _ = line
      queue = [[goal.map{|g| false}, 0]]
      seen = Set.new
      while queue.length > 0
        state, ct = queue.shift()
        return ct if state == goal
        next if seen.include?(state)
        seen << state
        buttons.each do |button|
          new_state = state.dup
          button.each{|w| new_state[w] = !new_state[w]}
          queue << [new_state, ct + 1]
        end
      end
      0
    end

    def parse_input
      @lines = @file_lines.map do |line|
        line = line.gsub("[", "").gsub("]", "").gsub("(", "").gsub(")", "").gsub("{", "").gsub("}", "")
        bits = line.split(" ")
        goal = bits.shift.split("").map{|b| b == "#"}
        bits.map!{|b| b.split(",").map(&:to_i)}
        voltage = bits.pop
        [goal, bits, voltage]
      end
    end
  end
end
