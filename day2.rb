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



