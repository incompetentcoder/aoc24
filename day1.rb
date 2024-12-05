pp File.open("day1input.txt").read.split("\n").map {|x| x.split(" ").map(&:to_i)}.transpose.map {|x| x.sort}.transpose.map {|x| (x[0]-x[1]).abs}.sum

