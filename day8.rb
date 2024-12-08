a=File.open("day8input.txt").read.split("\n")
keys={}
a.map!{|x| x.chars}
len=a.length
len.times do |x|
  len.times do |y|
    if (w=a[x][y]) =~ /\w/
      keys[w]=[] unless keys[w]
      keys[w].append([x,y])
    end
  end
end

keys.keys.each do |x|
  keys[x].permutation(2).each do |y|
    distx=y[0][0]-y[1][0]
    disty=y[0][1]-y[1][1]
    if (z1=y[0][0]+distx).between?(0,len-1) && (z2=y[0][1]+disty).between?(0,len-1)
      a[z1][z2]="#"
    end
  end
end

pp a.flatten.count("#")


keys.keys.each do |x|
  keys[x].permutation(2).each do |y|
    distx=y[0][0]-y[1][0]
    disty=y[0][1]-y[1][1]
    dist2x=distx
    dist2y=disty
    while  (z1=y[0][0]+dist2x).between?(0,len-1) && (z2=y[0][1]+dist2y).between?(0,len-1) do
      a[z1][z2]="#"
      dist2x+=distx
      dist2y+=disty
    end
  end
end

pp a.flatten.length - a.flatten.count(".")





