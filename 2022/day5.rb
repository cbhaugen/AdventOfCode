# frozen_string_literal: true

stacks_start, moves = File.read('day5sampledata.txt').split("\n\n")
stack_number = stacks_start[-1].to_i

stacks = stacks_start.split("\n").reverse.drop(1)
stacks_diff = stacks_start.split("\n").map(&:chars).reverse[1..]

moves = moves.split("\n").map do |move|
    move.split.filter_map do |box|
        box.to_i if box.to_i.to_s == box
    end
end

part1 = Array.new(stack_number) { [] }
part2 = Array.new(stack_number) { [] }

part1.each do |part|
    stacks.each do |line|
        (1..line.length).step(4).each_with_index do |v, idx|
            part[idx].push(line[v]) if line[v] != ' '
        end
    end
end

part2.each do |part|
    stacks.each do |line|
        (1..line.length).step(4).each_with_index do |v, idx|
            part[idx].push(line[v]) if line[v] != ' '
        end
    end
end

moves.each do |number, stack_from, stack_to|
    part1[stack_to - 1].concat(part1[stack_from - 1].pop(number).reverse)
    part2[stack_to - 1].concat(part2[stack_from - 1].pop(number))
end

puts "Part 1:", part1.map(&:last).join
puts "Part 2:", part2.map(&:last).join