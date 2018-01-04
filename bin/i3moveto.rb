#!/bin/env ruby

### Return of script:
### 123 456
### ^x  ^y

ARGUMENTS_SINGLE = {
	display:             "d",
	side:                "s",
	offset:              "o",
	display_offset:      "D",
	display_offset_axes: "A",
	exec_cmd:            "e"
}
ARGUMENTS_DOUBLE = {
	display:             "display",
	side:                "side",
	offset:              "offset",
	display_offset:      "display-offset",
	display_offset_axes: "display-offset-axes",
	exec_cmd:            "exec"
}

def get_arguments
	## Command line argument parser
	current_arg = nil
	args_h = {}
	ARGV.each do |arg|
		if (current_arg)
			args_h[current_arg] = arg
			current_arg = nil
			next
		end

		## single dash argument with string
		if (arg =~ /^-\S$/)
			if (found = ARGUMENTS_SINGLE.find { |k,v| v == arg.sub(/\A-/, "") })
				current_arg = found[0]
			end

		## double dash argument
		elsif (arg =~ /^--\S{2,}$/)
			if (found = ARGUMENTS_DOUBLE.find { |k,v| v == arg.sub(/\A--/, "") })
				current_arg = found[0]
			end
		end

	end

	return args_h
end

def main args = []

	exec = args[:exec_cmd] || nil
	unless (exec.nil?)
		system "#{exec} &"
	end

	xrandr_output = `xrandr`.split "\n"

	display = args[:display] || "primary"
	side = args[:side] || "center"
	offset = args[:offset] || "0,0"
	offset = offset.split(",").map &:to_i
	display_offset = args[:display_offset] || "NONE"
	display_offset_axes = args[:display_offset_axes] || "x"
	display_offset_axes = display_offset_axes.split(":").map &:to_sym

	## Get display dimensions / resolution
	#  and
	## Get display_offset display dimensions / resolution
	dimensions = [0,0]
	display_offset_dimensions = [0,0]
	xrandr_output.each do |line|
		if    (line.include? display)
			dimensions = line.match(/\d+x\d+/).to_s.split("x").map(&:to_i)
		elsif (line.include? display_offset)
			disp_off_dims = line.match(/\d+x\d+/).to_s.split("x").map(&:to_i)
			display_offset_dimensions[0] = disp_off_dims[0]  if (display_offset_axes.include? :x)
			display_offset_dimensions[1] = disp_off_dims[1]  if (display_offset_axes.include? :y)
		end
		break  if (dimensions != [0,0] && (display_offset_dimensions != [0,0] || display_offset == "NONE"))
	end

	## Calculate position
	position = [0,0]
	case side
	when "center"
		position = [
			(dimensions[0].to_f / 2.to_f).round,
			(dimensions[1].to_f / 2.to_f).round
		]

	when "top"
		position = [
			(dimensions[0].to_f / 2.to_f).round,
			0
		]
	when "bottom"
		position = [
			(dimensions[0].to_f / 2.to_f).round,
			dimensions[1]
		]
	when "left"
		position = [
			0,
			(dimensions[1].to_f / 2.to_f).round
		]
	when "right"
		position = [
			dimensions[0],
			(dimensions[1].to_f / 2.to_f).round
		]

	when "top-left"
		position = [
			0,
			0
		]
	when "top-right"
		position = [
			dimensions[0],
			0
		]

	when "bottom-left"
		position = [
			0,
			dimensions[1]
		]
	when "bottom-right"
		position = [
			dimensions[0],
			dimensions[1]
		]
	end

	## Re-calculate position with offset(s)
	position = [
		position[0] + display_offset_dimensions[0] + offset[0],
		position[1] + display_offset_dimensions[1] + offset[1]
	]

	return position.join " "
end

args = get_arguments
main_output = main args
while (`pidof #{args[:exec_cmd].split(" ")[0]}`.empty?)
	## Wait until PID of command to execute exists
end  unless (args[:exec_cmd].nil?)
`i3-msg move window to position #{main_output}`

