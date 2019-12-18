-- Control Window v2.6.1-ubuntu
-- by Noah Rosenzweig
-- creation date: 13.11.2015  version creation date: 08.11.2016
-- last edited: 29.07.2017

-- vars and tables in script
fileS = "/home/noah/Projects/Lua/Programs/ControlWindow/data.txt"
file = io.open(fileS,"r")
dbFileS = "/home/noah/Dropbox/Lua/ControlWindow/controlWindow_v2/reminder.txt"
dbFile = io.open(dbFileS,"r")
progName = "ControlWindow"
progVers = "2.6.1"
fileTshort = {}
fileTcmd = {}
sepChar = "."
inputFull = ""
input = ""
input2 = ""
reminderShort = "reminder"
reminderTitle = "REMINDER"
dbMaxLnLen = 0
startCmd = "xdg-open"

params = {...}

if not file then  -- check if data file exists, if not create a new one
	io.open(fileS,"w"):write("exit.\ngoogle.\"start http://www.google.at/#q=\""):close()
	file = io.open(fileS,"r")
	
	print("-- Data File Not Found --\n-- created new data file --\n")
end

function convertFileSpcl(method,funcFile,funcFileS,tableT)
	if funcFile then
		if method == "load" then
			for lineNum in io.lines(funcFileS) do
				table.insert(tableT,funcFile:read())
			end
				funcFile:close()
				funcFile = io.open(funcFileS,"r")
		elseif method == "save" then
					fileTmp = io.open(funcFileS,"w")  -- to delete contents of file
					fileTmp:close()
				fileW = io.open(funcFileS,"a+")
			for count = 1,#tableT do
				fileW:write(tableT[count] .. "\n")
			end
				fileW:close()
		end
		
	else
		
		dbFile = io.open(dbFileS,"w"):write(""):close()
		dbFile = io.open(dbFileS,"r")
		print("-- Dropbox Reminder File Not Found --\n-- created new file for future use --\n")
	end
end

function convertFile(method)
	if method == "toTable" then
		for lineNum in io.lines(fileS) do
			line = file:read()
			table.insert(fileTshort,string.sub(line,1,string.find(line,"%"..sepChar)-1))
			table.insert(fileTcmd,string.sub(line,string.find(line,"%"..sepChar)+1,-1))
		end
			file:close()
			file = io.open(fileS,"r")
	elseif method == "toFile" then
				fileTmp = io.open(fileS,"w")  -- to delete contents of file
				fileTmp:close()
			fileW = io.open(fileS,"a+")
		for count = 1,#fileTshort do
			fileW:write(fileTshort[count] .. sepChar .. fileTcmd[count] .. "\n")
		end
			fileW:close()
	end
end

-- Dropbox reminder
if dbFileS ~= "" then  -- only use reminder if dropbox path is given
	dbFileT = {}
	::retry::
	convertFileSpcl("load",dbFile,dbFileS,dbFileT)
	if dbFile then
		if #dbFileT > 0 then
		
			for count = 1, #dbFileT do  -- check longest line
				if string.len(dbFileT[count]) > dbMaxLnLen then
					dbMaxLnLen = string.len(dbFileT[count])
				end
			end
			if dbMaxLnLen < string.len(reminderTitle) then
				dbMaxLnLen = string.len(reminderTitle) + 0
			end
			
				-- print("max ln len: " .. dbMaxLnLen , dbMaxLnLen - string.len(reminderTitle) , (dbMaxLnLen - string.len(reminderTitle)) / 2 , dbMaxLnLen % 2)
			
				io.write("/")  -- write title roof
			for count = 1, dbMaxLnLen + 2 do
				io.write("-")
			end
				io.write("\\\n")
			
			if dbMaxLnLen - string.len(reminderTitle) >= 0 then  -- write REMINDER title
					io.write("|")
				for countTotal = 1, 2 do
					for count = 1, ((dbMaxLnLen - string.len(reminderTitle)) / 2) + 1 do
						io.write(" ")
					end
					if countTotal == 1 then
						io.write(reminderTitle)
					end
				end
					if dbMaxLnLen % 2 == 0 then
						io.write("|\n")
					else
						io.write(" |\n")
					end
			end
			
			for count = 0, #dbFileT + 1 do  -- write reminder message
				if count == 0 then  -- write first line
						io.write("/")
					for countDeco = 0, dbMaxLnLen + 1 do
						io.write("-")
					end
						io.write("\\\n")
				
				elseif count == #dbFileT + 1 then  -- write last line
						io.write("\\")
					for countDeco = 0, dbMaxLnLen + 1 do
						io.write("-")
					end
						io.write("/")
				
				else  -- write actual reminder message
					io.write("| " .. dbFileT[count])
						for countBorder = string.len(dbFileT[count]), dbMaxLnLen do
							io.write(" ")
						end
							io.write("|\n")
				end
			end
				io.write("\n\n")
					-- io.read()
					-- os.execute("cls")
			
		elseif #dbFileT == 0 then
			-- print("(Dropbox file is empty.)")
		end
	else
		print("-- Dropbox Reminder File Not Found --\n")
	end
end

-- Main Feature
convertFile("toTable")
print("Enter Shortcut:\n(type 'list' for a list of commands)")
::start::

if params[1] then
	for count = 1, #params do
		inputFull = inputFull .. " " .. params[count]
	end
	if string.sub(inputFull,1,1) == " " then
		inputFull = string.sub(inputFull, 2)
	end
else
	inputFull = string.lower(io.read())
end

	if dbFileS ~= "" then  -- only if rmeinder dropbox path is given
		-- reminder file
		if inputFull == reminderShort then
			os.execute("vim " .. dbFileS)
			os.exit()
		end
	end
if string.find(inputFull," ") then
	input = string.sub(inputFull,1,string.find(inputFull," ")-1)
	-- input2 = string.gsub(string.sub(inputFull,string.find(inputFull," ")+1,-1)," ","+")
	input2 = string.sub(inputFull,string.find(inputFull," ")+1,-1)
else
	input = inputFull
	input2 = ""
end
	if input == "list" then  -- for prog control; help / list cmd
			print("'add' - add new shortcut command\n'remove' - remove specific shortcut\n'reminder' - edit reminder message (clear file for no reminder)")
		for count = 1,#fileTshort do
			print("'" .. fileTshort[count] .. "' - " .. fileTcmd[count])
		end
			goto start
	elseif input == "add" then  -- add cmd
		print("Insert new command shortcut:")
			input = io.read()
		table.insert(fileTshort,input)
		print("Insert command for '" .. fileTshort[#fileTshort] .. "':\n(Use correct syntax)")
			input = string.gsub(io.read(),"&","^&")
		table.insert(fileTcmd,input)
		print("'" .. fileTshort[#fileTshort] .. "' - " .. fileTcmd[#fileTcmd])
			convertFile("toFile")
		print("Added to file!")
			goto start
	elseif input == "remove" then  -- remove cmd
		for count = 1,#fileTshort do
			print("(" .. count .. ") " .. file:read())
		end
			file:close()
			file = io.open(fileS,"r")
		print("Select number to remove.")
		input = io.read("*number","*l")
		if input == 0 then
			print("Enter Shortcut:")
			goto start
		else
			for count = 1,#fileTshort do
				if input == count then
					table.remove(fileTshort,count)
					table.remove(fileTcmd,count)
				end
			end
				convertFile("toFile")
			print("Removed from file!")
		end
			goto start
	elseif input == "data" then  -- edit data.txt
		os.execute("vim " .. fileS)
		goto start
	end
	
	for count = 1,#fileTshort do  -- reading from file for shortcuts
		if input == fileTshort[count] then
				if input == "exit" then
					os.exit()
				end
				if string.sub(fileTcmd[count], string.len(startCmd) + 2, string.len(startCmd) + 5) == "http" then
					input2 = string.gsub(input2," ","+")
				end
			local cmd = fileTcmd[count] .. input2
			os.execute(cmd)
			os.exit();
			--[[tmpEndSec = tonumber(os.date("%S") + 3)  -- TEMPORARY MEASSURE - closes app when console closes if console started the app
				if tmpEndSec > 59 then
					tmpEndSec = tonumber(tmpEndSec - 59)
					tmpEndMin = tonumber(os.date("%M") + 1)
				else
					tmpEndMin = tonumber(os.date("%M"))
				end
			while true do  -- weird behaviour with linux, executes os.exit() first so had to add delay
				if tonumber(os.date("%S")) >= tmpEndSec and tonumber(os.date("%M")) == tmpEndMin then
					os.exit()
					break
				end
			end--]]
		end
	end
	
	if params[1] then
		os.exit()
	end
	print("Command not valid. Please enter valid command:")
goto start
