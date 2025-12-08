require_relative "../utils/part"
require "set"

module Day8
  class Part1 < Part
    def call
      combos = @boxes.combination(2).map{|(a, b)| [a, b, dist(a, b)]}.sort_by{|(_, _, d)| d}
      ten = combos.first(1000)

      groups = ten.map{|(a, b, _)| [@boxes.index(a), @boxes.index(b)].to_set}

      last = 0
      while groups.length != last
        last = groups.length
        new_group = []
        groups.each do |group|
          g = new_group.find{|g| (g & group).length > 0}
          if g
            g.merge(group)
          else
            new_group << group
          end
        end
        groups = new_group
      end

      result = groups.map{|g|g.length}.sort.reverse.first(3).inject(:*)
      puts "Result: #{result}"
    end

    def dist(a, b)
      Math.sqrt(a.zip(b).map{|s| s.inject(:-)}.map{|n| n**2}.sum)
    end

    def parse_input
      @boxes = @file_lines.map{|line| line.split(",").map(&:to_i)}
    end
  end
end
