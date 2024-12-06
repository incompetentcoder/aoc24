a=File.open("day4input.txt").read.split("\n").map {|x| " "*3 + x + " "*3}.prepend([" "*146]*3).append([" "*146]*3).join

ind=0
res=0
while b=a.index("X",ind) do
  ind=b+1
  res+= [[a[b],a[b+1],a[b+2],a[b+3]],      #right
         [a[b],a[b-1],a[b-2],a[b-3]],      #left
   [a[b],a[b-146],a[b-292],a[b-438]], #up
   [a[b],a[b+146],a[b+292],a[b+438]], #down
   [a[b],a[b-145],a[b-290],a[b-435]], #upright
   [a[b],a[b+147],a[b+294],a[b+441]], #downright
   [a[b],a[b+145],a[b+290],a[b+435]], #downleft
   [a[b],a[b-147],a[b-294],a[b-441]]  #upleft
  ].collect {|x| x==["X","M","A","S"]}.count(true)
end

pp res

ind=0
res=0
while b=a.index("A",ind) do
  ind=b+1
  if [a[b-147],a[b],a[b+147]] == ["M","A","S"] || [a[b+147],a[b],a[b-147]] == ["M","A","S"]
    if [a[b-145],a[b],a[b+145]] == ["M","A","S"] || [a[b+145],a[b],a[b-145]] == ["M","A","S"]
      res+=1
    end
  end
end

pp res
