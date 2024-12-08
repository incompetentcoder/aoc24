require 'parallel'

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
c=a.join.chars
res = Parallel.map((0...c.length), in_processes: 6)  do |d|
  honk=0
  if c[d] == "."
    direction=0
    pos=c.index("^").divmod(a.length) 
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
          honk=1
          break
        else
          b[pos[0]][pos[1]]=direction.to_s
        end
      end
    end
  end
  d=honk
end

pp res.sum




