local hostname = "127.0.0.1"
local username = "root"
local password = ""
local database = "mta"
local port = 3306

local gMySQLCon = nil

function connectToDatabase(res)

	gMySQLCon = dbConnect("mysql", "dbname=" .. database .. ";host=" .. hostname, username, password)
	
	if (not gMySQLCon) then
		cancelEvent(true, "Database could not Connect")
		return
	end
	
	outputServerLog("Database connected!")

end
addEventHandler("onResourceStart", getResourceRootElement(), connectToDatabase, false)

function getMySQLC()
	return gMySQLCon
end