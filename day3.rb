a=File.open("day3input.txt").read

pp a.scan(/mul\(\d+,\d+\)/).map(&:to_i).reduce(:*)}.sum

