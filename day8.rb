# frozen_string_literal: true

@rows = []
@columns = []
@visible_trees = 0
@edge_length = 0

# open file, find grid edge length, form rows array
file = File.open('day8data.txt').each_line do |line|
    @edge_length =  line.strip.length
    @rows << line.strip
end

# turn rows strings to integers
@rows.map! do |str|
    (str.scan(/./)).map! { |n| n.to_i }
end

# create column array
@columns = @rows.transpose

# check all interior trees against trees in same row and column
def visible(row_idx, col_idx, target_tree)

    left = (0..col_idx-1).map { |n| [row_idx, n] }
    right = ((col_idx+1)..(@edge_length - 1)).map { |n| [row_idx, (n)]}
    up = left.map { |arr| arr.reverse }
    down = right.map { |arr| arr.reverse }
    surround = [left, right, up, down]
    visible = false

    surround.any? { |dir| # check if visible from any: left, right, up, down
        next if visible == true
        dir.all? { |coords| # check each tree in one direction
            tree_height = @rows[coords[0]][coords[1]]
            tree_height < target_tree ? (visible = true) : (visible = false)
        }
    }
    visible ? (@visible_trees += 1) : 0
end

@rows.each_with_index do |row, row_index| # check rows by index
    row.each_with_index do |target_tree, col_index| #check columns by index
        # if tree is on the outside of the grid, it's visible
        if row_index == 0 || row_index == (@edge_length - 1)
            @visible_trees += 1
        elsif col_index == 0 || col_index == (@edge_length - 1)
            @visible_trees += 1
        else # check all interior trees against trees in same row and column
            visible(row_index, col_index, target_tree)
        end
    end
end

# answer
p @visible_trees