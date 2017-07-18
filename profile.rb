#!/home/noah/.rvm/rubies/default/bin/ruby

defaultFile = "/home/noah/.config/i3/config"
profile = "NO PROFILE"
keyword = "#PROFILE="
if (!ARGV[0].nil?)
	profile = ARGV[0]
else
	case (`hostname`.strip)
	when "desktop-ubuntu"
		profile = "h77m"
	when "noah-acer"
		profile = "acer"
	end
end
if (ARGV[1].nil?)
	f = defaultFile
else
	f = ARGV[1]
end
if (!File.file? f)
	puts "ERROR: file \"#{f}\" doesn't exist! Exitting."
	exit
else
	fr = File.read f
end
text = fr.split "\n"
finalArr = Array.new

text.each do |line|
	curProfile = line[line.index(keyword) + keyword.length .. -1] if (line.include? keyword)
	if (curProfile == profile) && (line.lstrip[0] == "#")
		finalArr.push "#{line.sub "#",""}"
		next

	elsif (curProfile != profile) && (!curProfile.nil?) && (line.lstrip[0] != "#")
		finalArr.push "##{line}"
		next
	end

	finalArr.push line
end

finalArr.push "\n"

fw = File.new f, "w"
fw.puts finalArr.join "\n"
fw.close

