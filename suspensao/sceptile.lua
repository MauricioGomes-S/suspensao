local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
MTclient = Tunnel.getInterface("arena")
Mts = {} 
Tunnel.bindInterface("suspensao", Mts) 

RegisterNetEvent("callback")
AddEventHandler("callback",function(args)
    if args then 
       TriggerClientEvent("returncall",args)
    end
end)

RegisterCommand("susp", function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
        print(args[1])
        TriggerClientEvent("returncall",source,tonumber(args[1]))
end)


RegisterServerEvent("trywheel") 
AddEventHandler("trywheel",function(nveh,arg)
    print(arg)
	TriggerClientEvent("syncwheel",-1,nveh,arg)
end)