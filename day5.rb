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

correct=0
wrong=0
wrong2=0

a[1].each do |x|
  wrong=0
  wrong2=1
  while wrong2==1 do
    wrong2=0 
    x.each_index do |y| 
      if (tmp = x[0..y] & b[x[y]]) != []
        x[x.index(tmp[0])]=x[y]
        x[y]=tmp[0]
        wrong=1
        wrong2=1
      end
    end
  end
  correct+=x[x.length/2] if wrong==1
end

pp correct
