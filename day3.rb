a=File.open("day3input.txt").read

pp a.scan(/mul\(\d+,\d+\)/).map {|x| x.scan(/\d+/).map(&:to_i).reduce(:*)}.sum

ind=0
res=0
while (b=a.index("don't()",ind)) != nil do
  res+=a[ind..b].scan(/mul\(\d+,\d+\)/).map {|x| x.scan(/\d+/).map(&:to_i).reduce(:*)}.sum
  ind=a.index("do()",b)
  break if ind==nil
end
pp res


