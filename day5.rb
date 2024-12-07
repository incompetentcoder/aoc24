a=File.open("day5input.txt").read.split("\n\n").map {|x| x.split("\n").map {|y| y.scan(/\d+|\d+/).map(&:to_i)}}
b={}
a[0].each {|x,y| b[x] ? b[x].push(y) : b[x]=[y]}

correct=0
wrong=0

a[1].each do |x|
  wrong=0 
  x.each_index do |y| 
    if (x[0..y] & b[x[y]] != [])
      wrong=1
      break
    end
  end
  correct+=x[x.length/2] unless wrong==1
end

pp correct
