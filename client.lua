local QBCore = exports['qb-core']:GetCoreObject()
local inZone = false
local currentZone = nil


CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local sleep = 1000
        local distanceAlma = #(playerCoords - FiveEngine.ItemAlma.coords)
        local distanceSatma = #(playerCoords - FiveEngine.ItemSatma.coords)
        local distanceIsleme = #(playerCoords - FiveEngine.ItemIsleme.coords)
        if distanceAlma < FiveEngine.maxDistance then
            if distanceAlma < FiveEngine.minDistance then
                inZone = true
                currentZone = "ItemAlma"
                DrawText3D(FiveEngine.ItemAlma.coords, "[E] Item Al")
                DrawMarker(1, FiveEngine.ItemAlma.coords.x, FiveEngine.ItemAlma.coords.y, FiveEngine.ItemAlma.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                FiveEngine.ItemAlma.radius * 1,
                FiveEngine.ItemAlma.radius * 1, 
                2.0, 
                0, 255, 0, 150, false, true, 2, nil, nil, false)
                sleep = 0

                if IsControlJustReleased(0, 38) then
                    QBCore.Functions.Progressbar("alma", "Item Toplanıyor...", FiveEngine.ToplamaProgresBarSaniye, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bum_bin@idle_b",
                        anim = "idle_d",
                        flags = 49,
                    }, {}, {}, function()
                        ClearPedTasks(playerPed)
                        TriggerServerEvent("baTu:iteminial")
                    end, function() 
                        ClearPedTasks(playerPed)
                    end)
                end
            end
        end
        if distanceSatma < FiveEngine.maxDistance then
            if distanceSatma < FiveEngine.minDistance then
                inZone = true
                currentZone = "ItemSatma"
                DrawText3D(FiveEngine.ItemSatma.coords, "[E] Item Sat")
                DrawMarker(1, FiveEngine.ItemSatma.coords.x, FiveEngine.ItemSatma.coords.y, FiveEngine.ItemSatma.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                FiveEngine.ItemSatma.radius * 2, 
                FiveEngine.ItemSatma.radius * 2, 
                2.0, 
                255, 0, 0, 150, false, true, 2, nil, nil, false)
                sleep = 0

                if IsControlJustReleased(0, 38) then
                    QBCore.Functions.Progressbar("satma", "Item Satılıyor...", FiveEngine.SatmaProGBar, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bum_bin@idle_b",
                        anim = "idle_d",
                        flags = 49,
                    }, {}, {}, function() 
                        ClearPedTasks(playerPed)
                        TriggerServerEvent("baTu:iteminisat")
                    end, function()
                        ClearPedTasks(playerPed)
                    end)
                end
            end
        end
        if distanceIsleme < FiveEngine.maxDistance then
            if distanceIsleme < FiveEngine.minDistance then
                inZone = true
                currentZone = "ItemIsleme"
                DrawText3D(FiveEngine.ItemIsleme.coords, "[E] Item İşle")
                DrawMarker(1, FiveEngine.ItemIsleme.coords.x, FiveEngine.ItemIsleme.coords.y, FiveEngine.ItemIsleme.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                FiveEngine.ItemIsleme.radius * 2, 
                FiveEngine.ItemIsleme.radius * 2,
                2.0,
                0, 0, 255, 150, false, true, 2, nil, nil, false)
                sleep = 0

                if IsControlJustReleased(0, 38) then
                    QBCore.Functions.Progressbar("isleme", "Item İşleniyor...", FiveEngine.IslemeProGBar, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bum_bin@idle_b",
                        anim = "idle_d",
                        flags = 49,
                    }, {}, {}, function()
                        ClearPedTasks(playerPed)
                        TriggerServerEvent("baTu:iteminiisledin")
                    end, function()
                        ClearPedTasks(playerPed)
                    end)
                end
            end
        end

        if distanceAlma > FiveEngine.maxDistance and distanceSatma > FiveEngine.maxDistance and distanceIsleme > FiveEngine.maxDistance then
            inZone = false
            currentZone = nil
        end

        Wait(sleep)
    end
end)


function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 250
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
    end
end
