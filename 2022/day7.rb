# frozen_string_literal: true

class Directory
    attr_reader :parent, :name
    attr_accessor :files

    def initialize(name, parent)
        @parent = parent
        @name = name
        @files = []
    end

    def size
        @files.sum { |file| file.size}
    end

    def flatten
        @files.grep(Directory).reduce([]) { |acc, file|
        acc.push file
        acc.concat file.flatten
    }
    end
end

class Elfiles
    attr_reader :name, :size

    def initialize(name, size)
        @name = name
        @size = size
    end
end

@top = Directory.new("/", nil)
lines = File.read("day7data.txt").split("\n")
current_dir = @top

# make directory tree
lines.drop(1).each do |line| # drop(1) ignores cd / line
    case line
    when /(\d+) (\S+)/ # file name/size
        current_dir.files.push Elfiles.new($2, $1.to_i)
    when /dir (\S+)/ # new directory
        current_dir.files.push Directory.new($1, current_dir)
    when "$ cd .." # change directory up
        current_dir = current_dir.parent
    when /\$ cd (\S+)/ # change directory direct
        current_dir = current_dir.files.find{ |file| file.name == $1 }
    end

end

sizes = @top.flatten.map{ |dir| dir.size }
total_space = 70000000
min_unused_space = 30000000
x = min_unused_space - (total_space - @top.size)

# part 1
part1 = sizes.sum { |n| n <= 100000 ? n : 0 }
# part 2
part2 = sizes.sort.find { |n| n >= x }

p part1
p part2