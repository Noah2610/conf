#!/bin/env ruby

class CmusRemote
	DEFAULT_COLOR               = '#44AAAA'
	SEMANTIC_COLOR              = DEFAULT_COLOR
	SEMANTIC_FORMAT             = [ :artist, :title ]
	SEMANTIC_SEPARATOR          = ' - '
	SEMANTIC_MAX_SIZES          = {
		artist: 25,
		title:  50,
		file:   75
	}
	SEMANTIC_TRUNCATE_CHAR      = ?.
	SEMANTIC_TIME_BAR_SEPARATOR = ' '
	TIME_BAR_COLOR              = '#AA8844'
	TIME_BAR_SIZE               = 8
	TIME_BAR_OUTER_CHARS        = ['', '']
	#TIME_BAR_OUTER_CHARS        = [?[, ?]]
	#TIME_BAR_OUTER_CHARS        = [?<, ?>]
	#TIME_BAR_OUTER_CHARS        = [?, ?]
	#TIME_BAR_INNER_CHAR         = ?#
	TIME_BAR_INNER_CHAR         = ?•
	#TIME_BAR_INNER_CHAR         = ?
	TIME_BAR_INNER_BLANK        = ?◦
	#TIME_BAR_INNER_BLANK        = ?◦
	TIME_BAR_POSITION           = :right
	#OUTPUT_PREFIX               = '<span color="#44AA44"></span> '
	#OUTPUT_SUFFIX               = ' <span color="#44AA44"></span>'
	OUTPUT_PREFIX               = ''
	OUTPUT_SUFFIX               = ''
	OUTPUT_PAUSED               = "<span color='#{DEFAULT_COLOR}'></span>"
	REPLACE_CHARS               = {
		?& => '&amp;',
		?< => '&lt;',
		?> => '&gt;'
	}
	MS_BUTTON = ENV['BLOCK_BUTTON']

	def initialize
		handle_ms_button
		@output = `cmus-remote -Q`.strip
		return_output ''  if (@output.empty?)
		handle_output
	end

	def handle_ms_button
		return  if (MS_BUTTON.nil? || MS_BUTTON.empty? || MS_BUTTON == 0)
		ms_button = MS_BUTTON.to_i
		case ms_button
		when 1, 2, 3
			`cmus-remote -u`
		when 4
			`cmus-remote -k +10`
		when 5
			`cmus-remote -k -10`
		end
	end

	def return_output string = '', color = DEFAULT_COLOR
		output = "#{get_prefix || ''}#{string.to_s}#{get_suffix || ''}"
		puts "#{output}\n\n"
		puts color
		exit
	end

	def get_sanatized_string string
		return string.gsub /[#{REPLACE_CHARS.keys.join('')}]/ do |to_replace|
			next REPLACE_CHARS[to_replace]
		end
	end

	def get_prefix
		return OUTPUT_PREFIX
	end

	def get_suffix
		return OUTPUT_SUFFIX
	end

	def handle_output
		case @output.match(/\Astatus (\S+)$/)[1].to_sym
		when :playing
			handle_output_playing
		when :paused
			return_output OUTPUT_PAUSED
		when :stopped
			exit
		end
	end

	def handle_output_playing
		info     = get_cmus_info
		semantic = get_semantic_text_from_info info
		time_bar = get_time_bar_from_info info
		case TIME_BAR_POSITION
		when :left
			output = [
				"<small>",
				"<span color='#{get_sanatized_string TIME_BAR_COLOR}'>",
				"#{get_sanatized_string              time_bar}",
				"</span>",
				"#{get_sanatized_string              SEMANTIC_TIME_BAR_SEPARATOR}",
				"<span color='#{get_sanatized_string SEMANTIC_COLOR}'>",
				"#{get_sanatized_string              semantic}",
				"</span>",
				"</small>"
			].join('')
		when :right, nil
			output = [
				"<small>",
				"<span color='#{get_sanatized_string SEMANTIC_COLOR}'>",
				"#{get_sanatized_string              semantic}",
				"</span>",
				"#{get_sanatized_string              SEMANTIC_TIME_BAR_SEPARATOR}",
				"<span color='#{get_sanatized_string TIME_BAR_COLOR}'>",
				"#{get_sanatized_string              time_bar}",
				"</span>",
				"</small>"
			].join('')
		end
		return_output output
	end

	def get_cmus_info
		return (
			@output.scan(/^tag (?<tag>\S+?) (?<body>.+)$/).map do |tag, body|
				next [tag.to_sym, body]
			end .to_h
		).merge(
			@output.scan(/^(?<name>file|duration|position) (?<body>.+)$/).map do |name, body|
				next [name.to_sym, body]
			end .to_h
		)
	end

	def get_semantic_text_from_info info
		use_filename   = false
		semantic = SEMANTIC_FORMAT.map do |tag|
			next get_truncated_string info[tag], ((SEMANTIC_MAX_SIZES[tag] || 0) - 1)  if (!!info[tag])
			use_filename = true
			next nil
		end .reject { |x| !x } .join(SEMANTIC_SEPARATOR) .strip
		return semantic  unless (use_filename || semantic.empty?)
		return get_truncated_string get_filename_from_info(info), ((SEMANTIC_MAX_SIZES[:file] || 0) - 1)
	end

	def get_truncated_string string, target_index
		return string  if (target_index < 0 || target_index + 1 >= string.size)
		dots = [3, ((string.size - target_index) - 1)].min
		return "#{string[0 .. (target_index - dots)]}#{SEMANTIC_TRUNCATE_CHAR * dots}"
		return string
	end

	def get_filename_from_info info
		filepath = info[:file]
		filename = filepath.split(?/).last.sub(/\.[\w-]+\z/, '')
		return filename
	end

	def get_time_bar_from_info info
		track_length   = info[:duration]
		track_position = info[:position]
		outer_chars    = TIME_BAR_OUTER_CHARS
		inner_char     = TIME_BAR_INNER_CHAR
		inner_size     = TIME_BAR_SIZE - (outer_chars.reduce { |a,b| a.size + b.size })
		inner_blank    = TIME_BAR_INNER_BLANK
		track_percent  = ((track_position.to_f / track_length.to_f) * 100).round
		chars          = ((inner_size.to_f / 100.0) * track_percent).round
		blanks         = inner_size - chars
		time_bar       = "#{outer_chars[0]}#{inner_char * chars}#{inner_blank * blanks}#{outer_chars[1]}"
		return time_bar
	end
end

cmus_remote = CmusRemote.new
