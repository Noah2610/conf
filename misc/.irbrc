require 'irb/ext/save-history'  # For history
require 'irb/completion'        # For auto-completion
require 'awesome_print'
require 'pathname'

# History
IRB.conf[:SAVE_HISTORY] = 5000
history_dir             = "#{ENV['HOME']}/.cache"
Dir.mkdir history_dir     unless (File.directory? history_dir)
IRB.conf[:HISTORY_FILE] = File.join history_dir, 'irb_history'

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT][:CUSTOM] = {
  PROMPT_I: "%N(%m):%03n:%i> ",   # normal prompt
  PROMPT_S: "%N(%m):%03n:%i%l ",  # prompt for continuated strings
  PROMPT_C: "%N(%m):%03n:%i* ",   # prompt for continuated statement
  RETURN:   "=> %s\n"             # used to printf
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
