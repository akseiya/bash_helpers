def ansi256color(str, colorcode)
	"\033[38;5;%dm%s\033[0m" % [colorcode, str]
end

ansi256table = 16.upto(255).to_a

puts '\e[38;5;Xm'
16.upto(255) do |i| 
	print ansi256color('%03d' % i, i) 
	((i - 15) % 6 == 0) ? (puts()) : (print(" ")) 
end
puts