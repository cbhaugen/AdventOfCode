# frozen_string_literal: true

fully_covered = 0
overlap = 0

File.foreach('day4data.txt') do |line|
    ranges = eval("[#{line.gsub("-", "..")}]")
    ranges.each_slice(2) do |a, b|
        # part 1
        fully_covered += 1 if (a.cover?(b) || b.cover?(a))
        # part 2
        range1 = a.to_a
        range2 = b.to_a
        overlap += 1 if (range1.any?{ |x| range2.include?(x)})
    end
end

puts 'fully covered'
puts fully_covered
puts 'overlap'
puts overlap
