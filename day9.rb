a=File.open("day9input.txt").read.chars.map(&:to_i).each_with_index.each_slice(2).map {|x,y| [[(x[1]/2)]*x[0],["."]*y[0]]}.flatten
b=a.each_with_index.find_all{|x| x[0]=="."}
b.each do |x|
  break if x[1] > a.length
  while a[-1].class != Integer do
    a.pop
  end
  a[x[1]]=a.pop
end
pp a.each_with_index.map{|x,y| x*y}.sum  
