require 'pry'
require 'set'
$a=File.open("day10input.txt").read.split("\n").map {|x| x.chars.map(&:to_i)}
b=$a.flatten
$zeros=[]
$nines=[]
b.each_index do |c|
  if b[c] == 0
    $zeros.append(c.divmod($a.length))
  elsif b[c] == 9
    $nines.append(c.divmod($a.length))
  end
end
$directions=[[-1,0],[0,1],[1,0],[0,-1]]
$vals=Hash.new


def meh(start,o)
  if $nines.include?(start)
    $vals[o] << start

  else
    $directions.each do |d|
      tmp=[start[0]+d[0],start[1]+d[1]]
      if $a[tmp[0]] && (b=$a[tmp[0]][tmp[1]])
        if b == $a[start[0]][start[1]]+1
            (meh(tmp,o))
        end
      end
    end
  end
end


$zeros.each do |b|
  $vals[b]=Set.new
  meh(b,b)
end

pp $vals.values.map {|x| x.length}.sum

$zeros.each do |b|
  $vals[b]=[]
  meh(b,b)
end 

pp $vals.values.map {|x| x.length}.sum


