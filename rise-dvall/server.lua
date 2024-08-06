local QBCore = exports["qb-core"]:GetCoreObject();

CreateThread(function()
    while true do
        Wait(1000*Config.AutoDvallTime*60) -- Every hour send an event to client clear vehicles.
        if Config.AutoDvall then
        TriggerClientEvent("risedvall:clearVehicles", -1)
        end
    end
end)

QBCore.Commands.Add(Config.DvallCommand, "Delete all vehicles", {}, true, function(source, args)
    TriggerClientEvent("risedvall:clearVehicles", -1)
end, "admin")
QBCore.Commands.Add(Config.UndvallCommand, "Cancel global deletion", {}, true, function(source, args)
    TriggerClientEvent("risedvall:canceldvall", -1)
end, "admin")
