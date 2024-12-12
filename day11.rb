require 'parallel'
require 'pry'
a=File.open("day11input.txt").read.split(" ").map(&:to_i)
25.times do |muh| 
  b=[]
  a.each do |x|
    if x==0
      b.append(1)
    elsif (z=x.to_s).length.even?
      b.append(*[z[0...z.length/2].to_i,z[z.length/2...z.length].to_i])
    else
      b.append(x*2024)
    end
  end
  a=b
end
pp a.length


a=File.open("day11input.txt").read.split(" ").map {|x| x.to_i}
total=a.tally
total.default=0
75.times do |muh|
  total2=Marshal.load(Marshal.dump(total))
  total2.default=0
  total.keys.each do |x|
    if total[x] > 0
      if x==0
        total2[1]+=1*(total[0])
        total2[0]-=1*(total[0])
      elsif (z=x.to_s).length.even?
        total2[z[0...z.length/2].to_i]+=1*(total[x])
        total2[z[z.length/2...z.length].to_i]+=1*(total[x])
        total2[x]-=1*(total[x])
      else
        total2[x*2024]+=1*(total[x])
        total2[x]-=1*(total[x])
      end
    end
  end
  total=Marshal.load(Marshal.dump(total2))
end
pp total.values.sum    

