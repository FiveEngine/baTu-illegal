local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent("baTu:iteminial")
AddEventHandler("baTu:iteminial", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = FiveEngine.ItemAlma.item
    local amount = FiveEngine.ItemAlma.amount
    
    if Player then
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('QBCore:Notify', src, item .. " aldın!", 'success')
    end
end)

RegisterNetEvent("baTu:iteminisat")
AddEventHandler("baTu:iteminisat", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = FiveEngine.ItemSatma.item
    local price = FiveEngine.ItemSatma.price
    local rewardType = FiveEngine.ItemSatma.paraturu -- Ödül türünü al
    
    if Player.Functions.GetItemByName(item) then
        Player.Functions.RemoveItem(item, 1)

        if rewardType == "cash" then
            Player.Functions.AddMoney('cash', price) -- 'cash' ödül ver
        elseif rewardType == "markedbills" then
            Player.Functions.AddItem('markedbills', price) -- 'markedbills' itemi ver
        elseif rewardType == "bank" then
            Player.Functions.AddMoney('bank', price)
        end

        TriggerClientEvent('QBCore:Notify', src, "Item sattın!", 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, "Satacak itemin yok!", 'error')
    end
end)


RegisterNetEvent("baTu:iteminiisledin")
AddEventHandler("baTu:iteminiisledin", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local requiredItem = FiveEngine.ItemIsleme.requiredItem
    local processedItem = FiveEngine.ItemIsleme.processedItem

    if Player.Functions.GetItemByName(requiredItem) then
        Player.Functions.RemoveItem(requiredItem, 1)
        Player.Functions.AddItem(processedItem, 1)
        TriggerClientEvent('QBCore:Notify', src, "Item işledin!", 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, "İşleyecek itemin yok!", 'error')
    end
end)
