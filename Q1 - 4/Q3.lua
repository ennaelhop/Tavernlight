function removeMemberFromParty(playerId, memberName)
    local player = Player(playerId)
    local party = player:getParty()
    
    for _, member in pairs(party:getMembers()) do
        if member:getName() == memberName then
            party:removeMember(member)
            break
        end
    end
end