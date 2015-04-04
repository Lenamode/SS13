--[[
  __  __        _____           _ _       
 |  \/  |      |  __ \         | (_)      
 | \  / |_  __ | |__) |__ _  __| |_  ___  
 | |\/| \ \/ / |  _  // _` |/ _` | |/ _ \ 
 | |  | |>  <  | | \ \ (_| | (_| | | (_) |
 |_|  |_/_/\_\ |_|  \_\__,_|\__,_|_|\___/ 
--]]

function SendCartoServer(car)
	net.Start( "GetCar" )
		net.WriteEntity(LocalPlayer())
		net.WriteEntity(car)
	net.SendToServer()
end

function MenuCommand(ply,cmd,args)
	if LocalPlayer():InVehicle() then
		car = LocalPlayer():GetVehicle()
		SendCartoServer(car)
	end
end
concommand.Add("+mx_menu", MenuCommand)