a=File.open("day3input.txt").read

pp a.scan(/mul\(\d+,\d+\)/).map {|x| x.scan(/\d+/).map(&:to_i).reduce(:*)}.sum

pp ("do()"+a).split("don\'t()").map {|x| x.gsub(/.*do()/,"")}.join.scan(/mul\(\d+,\d+\)/).map {|x| x.scan(/\d+/).map(&:to_i).reduce(:*)}.sum


