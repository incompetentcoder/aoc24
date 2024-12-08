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



a=File.open("day6input.txt").read.split("\n")
directions=[[-1,0],[0,1],[1,0],[0,-1]]
direction=0
c=a.join
ind=0
honks=0
while d=c.index(".",ind) do
  direction=0
  pos=c.index("^").divmod(a.length) 
  ind=d+1
  d=d.divmod(a.length)
  b=Marshal.load(Marshal.dump(a))
  b[d[0]][d[1]]="#"

  while (pos[0]+directions[direction][0]).between?(0,a.length-1) && (pos[1]+directions[direction][1]).between?(0,a.length-1) do
    if b[pos[0]+directions[direction][0]][pos[1]+directions[direction][1]]=="#"
      direction=(direction+1)%4
    else
      pos[0]+=directions[direction][0]
      pos[1]+=directions[direction][1]
      if b[pos[0]][pos[1]]==direction.to_s
        honks+=1
        break
      else
        b[pos[0]][pos[1]]=direction.to_s
      end
    end
  end
end

pp honks




