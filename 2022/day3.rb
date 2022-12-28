# frozen_string_literal: true

total_priority = 0
badge_priority = 0
items = Hash[[*('a'..'z'), *('A'..'Z')].to_a.zip((1..52).to_a)]

# finds common character in strings
class String
  def intersection(other)
    str = dup
    str.chars & other.chars
  end
end

# part 1
File.foreach('day3data.txt') do |line|
  part1, part2 = line.chars.each_slice(line.length / 2).map(&:join)
  common = part1.intersection(part2).join
  total_priority += items[common]
end

puts total_priority

# part 2
File.foreach('day3data.txt').each_slice(3) do |packs|
  pack1 = packs[0]
  pack2 = packs[1]
  pack3 = packs[2]
  badge = pack1.intersection(pack2).join.intersection(pack3).join.strip
  badge_priority += items[badge]
end

puts badge_priority
