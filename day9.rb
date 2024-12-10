a=File.open("day9input.txt").read.chars.map(&:to_i).each_with_index.each_slice(2).map {|x,y| [[(x[1]/2)]*x[0],["."]*y[0]]}.flatten
b=a.each_with_index.find_all{|x| x[0]=="."}
b.each do |x|
  break if x[1] > a.length
  while a[-1].class != Integer do
    a.pop
  end
  a[x[1]]=a.pop
end
pp a.each_with_index.map{|x,y| x*y}.sum 

a=File.open("day9input.txt").read.chars.map(&:to_i).each_with_index.each_slice(2).map {|x,y| y[0] > 0 ? [[(x[1]/2)]*x[0],["."]*y[0]] : [[(x[1]/2)]*x[0]]}.
flatten(1)
  a.length.times do |b|
    if a[b][0]=="."
      (a.length-1).downto(b) do |c|
        if a[c][0] != "."
          tmp2=a[b].length - a[c].length  
          if tmp2 >= 0
            ab=a[b]
            ac=a[c]
            a[b]=ab[0,tmp2]
            a[c]=["."]*ac.length
            a.insert(b,ac)
            a.delete_at(b+1) if tmp2==0
            break
          end
        end
      end
    end
  end

pp a.flatten.each_with_index.map {|x,y| x=="." ? 0*y : x*y}.sum






