--[[
  __  __        _____           _ _       
 |  \/  |      |  __ \         | (_)      
 | \  / |_  __ | |__) |__ _  __| |_  ___  
 | |\/| \ \/ / |  _  // _` |/ _` | |/ _ \ 
 | |  | |>  <  | | \ \ (_| | (_| | | (_) |
 |_|  |_/_/\_\ |_|  \_\__,_|\__,_|_|\___/ 
--]]
AddCSLuaFile()
AddCSLuaFile("mx_radio/cl_init.lua")
if SERVER then
	include("mx_radio/init.lua")
elseif CLIENT then
	include("mx_radio/cl_init.lua")
end