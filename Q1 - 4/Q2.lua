function printSmallGuildNames(memberCount)
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount)
    local result = db.storeQuery(selectGuildQuery)

    if not result then
        print ("Error: Query result not found.")
        return
    end

    while true do
        local guildName = result.getString("name")
        if not guildName then
            break
        end
        print(guildName)
    end
end