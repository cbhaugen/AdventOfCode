# frozen_string_literal: true

score = 0
score2 = 0

# day 1 - X, rock (1); Y, paper (2); Z, scissors(3)
File.foreach('day2data.txt') do |line|
  case line
  when /A\sX/ then score += 4 # rock vs rock
  when /A\sY/ then score += 8 # rock vs paper
  when /A\sZ/ then score += 3 # rock vs scissors
  when /B\sX/ then score += 1 # paper vs rock
  when /B\sY/ then score += 5 # paper vs paper
  when /B\sZ/ then score += 9 # paper vs scissors
  when /C\sX/ then score += 7 # scissors vs rock
  when /C\sY/ then score += 2 # scissors vs paper
  when /C\sZ/ then score += 6 # scissors vs scissors
  end
end

puts score

# day2 - X Y Z are lose (0), draw (3), win (6)
File.foreach('day2data.txt') do |line|
  case line
  when /A\sX/ then score2 += 3 # rock lose0 - scissors3
  when /A\sY/ then score2 += 4 # rock draw3 - rock1
  when /A\sZ/ then score2 += 8 # rock win6 - paper2
  when /B\sX/ then score2 += 1 # paper lose0 - rock1
  when /B\sY/ then score2 += 5 # paper draw3 - paper2
  when /B\sZ/ then score2 += 9 # paper win6 - scissors3
  when /C\sX/ then score2 += 2 # scissors lose0 - paper2
  when /C\sY/ then score2 += 6 # scissors draw3 - scissors3
  when /C\sZ/ then score2 += 7 # scissors win6 - rock1
  end
end

puts score2
