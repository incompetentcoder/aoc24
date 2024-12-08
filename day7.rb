a=File.open("day7input.txt").read.split("\n").map {|x| x.scan(/\d+/).map(&:to_i)}

solutions=0
a.each do |x|
  ["+","*"].repeated_permutation(x.length-2).each do |y|
    val=x[1]
    (x.length-2).times do |z|
      case y[z]
      when "*"
        val=val*x[z+2]
      when "+"
        val=val+x[z+2]
      end
    end
    if val==x[0]
      solutions+=x[0]
      break
    end
  end
end

pp solutions

