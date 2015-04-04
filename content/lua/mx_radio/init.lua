--[[
  __  __        _____           _ _       
 |  \/  |      |  __ \         | (_)      
 | \  / |_  __ | |__) |__ _  __| |_  ___  
 | |\/| \ \/ / |  _  // _` |/ _` | |/ _ \ 
 | |  | |>  <  | | \ \ (_| | (_| | | (_) |
 |_|  |_/_/\_\ |_|  \_\__,_|\__,_|_|\___/ 
--]]
AddCSLuaFile("cl_car_radio.lua")

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Serverside Stuff
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
// Station File Setup
//Check if file exists, and create it if it doesn't
///////////////////////////////////////////////////////////////

	//see if file exsists
	if !file.Exists( "mxradio.txt", "DATA" ) then

		StationFile = {}
		
	
		StationFile[1] = {
			stationURL = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=512156&play_status=1",
			info = "Space Station 13 Jazz"
		}

		StationFile[2] = {
			stationURL = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=212505&play_status=1",
			info = "Space Station 13 Classical"
		}

		local SFile = file.Open( "mxradio.txt", "a", "DATA" )
		if !SFile then return end
		for  k,v in pairs(StationFile) do
			SFile:Write(v.stationURL.."\n")
			SFile:Write(v.info.."\n")
		end
		SFile:Close()
	end
///////////////////////////////////////////////////////////////////////////////////
//
// End Station File Setup
//
///////////////////////////////////////////////////////////////////////////////////

	radios ={}
	RadioNum =0

	util.AddNetworkString( "StationChange" )
	util.AddNetworkString( "RMenu" )
	util.AddNetworkString( "UpdateStation" )
	util.AddNetworkString( "CStationUpload" )
	util.AddNetworkString( "DeleteStation" )
	util.AddNetworkString( "GetCar" )

/////////////////////////////////////////////////////////////
// Setup Stations table
/////////////////////////////////////////////////////////////
	function SetUpStationTable()
		stations = {}
		local SFile = file.Read("mxradio.txt", "DATA")
		SFile = string.Split( SFile, "\n" )
		for  i=1, (table.getn(SFile) -1), 2 do
			stations[table.getn(stations) + 1] = {
				stationURL = SFile[i],
				info = SFile[i +1]
			}
		end
	end
	SetUpStationTable()

	
/////////////////////////////////////////////////////////////
//Receive Station Change
/////////////////////////////////////////////////////////////
	net.Receive( "StationChange", function( len, pl )
		station = net.ReadString()
		radio = net.ReadEntity()
		//send station to all players
		SendToAll(station, radio)
	end )
/////////////////////////////////////////////////////////////
//Delete Station 
/////////////////////////////////////////////////////////////
	net.Receive( "DeleteStation", function( len, pl )
		info = net.ReadString()
		DeleteStation(info)
	end )
	
	function DeleteStation(info)
		for k,v in pairs(stations) do
			if v.info == info then
				table.remove( stations, k)
			end
		end
		file.Delete( "mxradio.txt" )
		local SFile = file.Open( "mxradio.txt", "a", "DATA" )
		if !SFile then return end
		for  k,v in pairs(stations) do
			SFile:Write(v.stationURL.."\n")
			SFile:Write(v.info.."\n")
		end
		SFile:Close()
	end

/////////////////////////////////////////////////////////////
//Receive Custom Station 
/////////////////////////////////////////////////////////////
	net.Receive( "CStationUpload", function( len, pl )
		station = net.ReadString()
		info = net.ReadString()
		//Save the Station to the text file
		local SFile = file.Open( "mxradio.txt", "a", "DATA" )
			if !SFile then return end
			SFile:Write(station.."\n")
			SFile:Write(info.."\n")
			SFile:Close()
		SetUpStationTable()
	end )
	
/////////////////////////////////////////////////////////////
//Send Station to all Players
/////////////////////////////////////////////////////////////
	
	function SendToAll(station, radio)
		net.Start( "UpdateStation" )
			net.WriteString(station)
			net.WriteEntity(radio)
		net.Broadcast()
		for k,v in pairs(radios) do
			if radio == v.RadioEnt then
				radios[k] = {
					station = station,
					RadioEnt = radio,
				}
			end
		end
		if !RadioExsists(radio) then
			radios[RadioNum] = {
				station = station,
				RadioEnt = radio,
			}
			RadioNum = RadioNum +1
		end
	end
/////////////////////////////////////////////////////////////
//Manage Radios and their stations
/////////////////////////////////////////////////////////////
	function RadioManager()
		if (table.Count(radios) > 0) then
			for k,v in pairs (radios) do
				if !v.RadioEnt:IsValid() || v.station == "stop" then
					table.remove(radios, k)
				end
			end
		end
	end
	hook.Add( "Think", "Radio_Manager", RadioManager)
	function RadioExsists(radio)
		for k,v in pairs(radios) do
			if (v.RadioEnt == radio ) then return true end
		end
		return false
	end
	
	//Make the radios play when the player firsts spawns, if the radios where created before they joined
	function PlayerFirstSpawn( ply )
		if (table.Count(radios) > 0) then
			for k,v in pairs(radios) do
				NewJoinUpdate(ply, v.station, v.RadioEnt)
			end
		end
	end
	hook.Add( "PlayerInitialSpawn", "playerFirstSpawn", PlayerFirstSpawn )
	function NewJoinUpdate(ply, NewStation, RadioEnt)
		timer.Simple( 1, function()
			net.Start( "UpdateStation" )
				net.WriteString(NewStation)
				net.WriteEntity(RadioEnt)
			net.Send( ply )
		end )
	end
/////////////////////////////////////////////////////////////
//Start Rmenu
/////////////////////////////////////////////////////////////
function StartRMenu(ply, radio)
	net.Start( "RMenu" )
		net.WriteEntity(radio)
		net.WriteTable(stations)
	net.Send(ply)
end

/////////////////////////////////////////////////////////////
//Recieve Car Menu
/////////////////////////////////////////////////////////////
	net.Receive( "GetCar", function( len, pl )
		ply = net.ReadEntity()
		car = net.ReadEntity()
		StartRMenu(ply, car)
	end )