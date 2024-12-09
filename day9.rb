a=File.open("day9input.txt").read.chars.map(&:to_i).each_with_index.each_slice(2).map {|x,y| [[(x[1]/2)]*x[0],["."]*y[0]]}.flatten

while b=a.index(".") do
  a[b]=a.pop
end
pp a.each_with_index.map{|x,y| x*y}.sum  
