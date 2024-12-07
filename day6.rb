a=File.open("day6input.txt").read.split("\n")
directions=[[-1,0],[0,1],[1,0],[0,-1]]
direction=0
pos=a.join.index("^").divmod(a.length)
a[pos[0]][pos[1]]="X"

while (pos[0]+directions[direction][0]).between?(0,a.length-1) && (pos[1]+directions[direction][1]).between?(0,a.length-1) do
  if a[pos[0]+directions[direction][0]][pos[1]+directions[direction][1]]=="#"
    direction=(direction+1)%4
  else
    pos[0]+=directions[direction][0]
    pos[1]+=directions[direction][1]
    a[pos[0]][pos[1]]="X"
  end
end

pp a.join.count("X")




