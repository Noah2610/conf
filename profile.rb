#!/home/noah/.rvm/rubies/default/bin/ruby

#file = "/home/noah/.config/i3/config"
fileAlias = {
	i3config: "/home/noah/.config/i3/config",
	i3status: "/home/noah/.config/i3/i3status.conf",
	wrapper:  "/home/noah/.config/i3/wrapper.py",
	bashrc:   "/home/noah/.bashrc",
	vimrc:    "/home/noah/.vimrc",
	xmodmap:  "/home/noah/.Xmodmap"
}
files = [
	fileAlias[:i3config],
	fileAlias[:i3status],
	fileAlias[:wrapper]
]
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

files = Array.new  unless (ARGV[1].nil?)
count = 1
loop do
	break  unless count < ARGV.length

	file = ARGV[count]
	fileAlias.each do |item|
		file = item[1]  if (file == item[0].to_s)
	end
	if (!File.file? file)
		puts "ERROR: file \"#{file}\" doesn't exist! Exitting."
		exit
	end
	files.push file

	count += 1
end
	

files.each do |file|

	fr = File.read file
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
					linePush = "#{line.sub "##",""}"  unless (line.lstrip[1] != "#")
					linePush = "#{line.sub "#",""}"   unless (line.lstrip[0 .. 1] == "# ")
				elsif (cur != profile) && (!cur.empty?)
					if (line.lstrip[0] == "#")
						linePush = "##{line}"  unless (line.lstrip[0 .. 1] == "##") || (line.lstrip[0 .. 1] == "# ")
					else
						linePush = "###{line}"
					end
				end
			end

		end

		finalArr.push linePush
	end

	finalArr.push "\n"
	fw = File.new file, "w"
	fw.puts finalArr.join "\n"
	fw.close

end

