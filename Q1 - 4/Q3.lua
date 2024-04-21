function removeMemberFromParty(playerId, memberName)
    local player = player:getPlayer(playerId)
    if not player then 
        print ("Error: Player with playerId " .. tostring(playerId) .. "not found")
        return 
    end

    local party = player:getParty()
    
    for k,v in pairs(party:getMembers()) do
        if v == memberName then
            party:removeMember(v)
            break
        end
    end
end