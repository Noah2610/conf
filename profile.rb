#!/home/noah/.rvm/rubies/default/bin/ruby

file = "/home/noah/.config/i3/config"
profile = ""
keyword = { base: "#PROFILE", single: "#PROFILE=", start: "#PROFILE_START=", end: "#PROFILE_END" }


if (!ARGV[0].nil?)
	profile = ARGV[0]
else
	case (`hostname`.strip)
	when "desktop-ubuntu"
		profile = "h77m"
	when "noah-acer"
		profile = "acer"
	else
		profile = "acer"
	end
end
file = ARGV[1]  unless (ARGV[1].nil?)
	
if (!File.file? file)
	puts "ERROR: file \"#{file}\" doesn't exist! Exitting."
	exit
else
	fr = File.read file
end

text = fr.split "\n"
finalArr = Array.new

block = Array.new
single = ""

text.each do |line|
	linePush = line
	method = ""
	curProfile = ""

	if (line.include? keyword[:base])
		method = line.strip
		if (method.include? "=")
			method = method[0 .. method.index("=")]
			curProfile = line.strip[line.strip.index("=") + 1 .. line.strip.length]
		end
	end

	case method
	when keyword[:single]
		single = curProfile

	when keyword[:start]
		block.push curProfile

	when keyword[:end]
		block.pop

	else
		cur = block[-1].to_s
		cur = single  unless single.empty?
		single = ""

		if (!cur.empty?)
			if (cur == profile) && (line.lstrip[0] == "#")
				linePush = "#{line.sub "#",""}"
			elsif (cur != profile) && (!cur.empty?) && (line.lstrip[0] != "#")
				linePush = "##{line}"
			end
		end

	end

	finalArr.push linePush
end

finalArr.push "\n"
fw = File.new file, "w"
fw.puts finalArr.join "\n"
fw.close

