a=File.open("day2input.txt").read.split("\n").map {|x| x.split(" ").map(&:to_i)}

correct=0
correct2=0
a.each do |x|
  x.reverse! if x[0] > x[1]
  x.each_cons(2) do |y,z|
    correct2=1
    unless (z > y) && (z - y).between?(1,3)
      correct2=0
      break
    end
  end
  correct+=correct2
end

pp correct


correct=0
correct2=0
a.each do |x|
  hm = x.each_cons(2).map {|y,z| y > z}.tally
  x.reverse! if (hm[false] || 0) < 2
  x.each_index do |y|
    correct2=1
    x.values_at(*((0...x.length).to_a - [y])).each_cons(2) do |y1,y2|
      unless (y2 > y1) && (y2 - y1).between?(1,3)
        correct2=0
        break
      end
    end
    if correct2==1
      correct+=1
      break
    end
  end
end

pp correct

