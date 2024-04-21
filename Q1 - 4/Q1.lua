local RELEASE_STORAGE_EVENT_DELAY = 1000

local function releaseStorage(player)
    player:setStorageValue(player:getStorageKey(), -1)
end

function onLogout(player)
    if hasValidStorage(player) then
        addEvent(releaseStorage, RELEASE_STORAGE_EVENT_DELAY, player)
    end

    return true
end

function hasValidStorage(player)
    local playerKey = player:getStorageKey()

    if player:getStorageKey(playerKey) == 1 then
        return true
    end

    return false
end