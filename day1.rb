a=File.open("day1input.txt").read.split("\n").map {|x| x.split(" ").map(&:to_i)}.transpose

pp a.map {|x| x.sort}.transpose.map {|x| (x[0]-x[1]).abs}.sum

pp a[0].map {|x| x*a[1].count(x)}.sum
