phrase = Regexp.new(ARGV[0], true)
file = ARGV[1]

file = File.open(file, 'r')
file.each {|line| puts "#{file.lineno}: #{line}" if line.match phrase}
