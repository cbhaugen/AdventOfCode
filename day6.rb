# frozen_string_literal: true

def process(data, length)
    idx = 0
    unique_chars = []
    unique_number = unique_chars.length

    until unique_number == length
        unique_chars = data[idx,length].chars.to_a.uniq
        unique_number = unique_chars.length
        idx += 1
    end
    idx + length - 1
end

data = File.read("day6data.txt")
part1 = process(data, 4)
part2 = process(data, 14)

puts "Start of packet: #{part1}"
puts "Start of message: #{part2}"