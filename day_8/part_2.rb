require_relative "../utils/part"
require "set"

module Day8
  class Part2 < Part
    def call
      combos = @boxes.combination(2).map{|(a, b)| [a, b, dist(a, b)]}.sort_by{|(_, _, d)| d}

      groups = []
      seen = Set.new
      result = 0
      combos.each do |(a, b)|
        break if seen.length == @boxes.length && groups.length == 1
        seen << a
        seen << b
        groups << [a, b].to_set
        result = a[0] * b[0]
        groups = merge(groups)
      end

      puts "Result: #{result}"
    end

    def merge(groups)
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
      groups
    end

    def dist(a, b)
      Math.sqrt(a.zip(b).map{|s| s.inject(:-)}.map{|n| n**2}.sum)
    end

    def parse_input
      @boxes = @file_lines.map{|line| line.split(",").map(&:to_i)}
    end
  end
end
