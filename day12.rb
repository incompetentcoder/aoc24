require 'pry'
$a=File.open("day12input.txt").read.split("\n").map {|x| x.chars}
$directions=[[-1,0],[0,1],[1,0],[0,-1]]
$visited={}

def eep(index,d,visited)
  tmp=[index[0]+d[0],index[1]+d[1]]
  if tmp[0] >= 0 && tmp[1] >=0
    if $a[tmp[0]] && $a[tmp[0]][tmp[1]] != 0 && $a[tmp[0]][tmp[1]] == $a[index[0]][index[1]]
      if $visited[visited].include?(tmp)==false
        $visited[visited].push(tmp)
        $directions.each { |d2| eep(tmp,d2,visited)}
      end
    end
  end
end


$a.each_index do |x|
  $a[x].each_index do |y|
    if $visited.values.include?([[x,y]]) == false
      b=$a[x][y]
      if b != 0
        $visited[[x,y]]=[[x,y]]
        $directions.each {|d| eep([x,y],d,[x,y])}
        $visited[[x,y]].each {|z| $a[z[0]][z[1]]=0}
        $visited[[x,y]].sort!
      end
    end
  end
end


pp ($visited.values.map do |x|
  x.map do |y|
    sum=0
    $directions.each do |d|
      if x.include?([y[0]+d[0],y[1]+d[1]]) == false
        sum+=1
      end
    end
    sum
  end
end.map {|x| x.reduce(&:+)*x.length}).sum
      
