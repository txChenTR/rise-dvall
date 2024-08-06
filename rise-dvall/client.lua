local canceled = false;

RegisterNetEvent("risedvall:clearVehicles", function()
	canceled = true
	
    SendNUIMessage({
        ['action'] = "show",
		['time'] = Config.Time
    });
    Citizen.Wait(Config.Time * 1000)
		if canceled then
			for vehicle in EnumerateVehicles() do
				local delete = true;
				local coords = GetEntityCoords(vehicle)
		
				if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
					SetVehicleHasBeenOwnedByPlayer(vehicle, false)
					SetEntityAsMissionEntity(vehicle, false, false)
					DeleteVehicle(vehicle);
		
					if (DoesEntityExist(vehicle)) then 
						DeleteVehicle(vehicle)
					end
				end
			end
		end
end)

RegisterNetEvent("risedvall:canceldvall", function()
	canceled = false;
	SendNUIMessage({
        ['action'] = "close",
		['time'] = Config.Time
    });
end)

local entityEnumerator = {
	__gc = function(enum)
	if enum.destructor and enum.handle then
		enum.destructor(enum.handle)
	end
	enum.destructor = nil
	enum.handle = nil
end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil;
		disposeFunc(iter);
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle);
end