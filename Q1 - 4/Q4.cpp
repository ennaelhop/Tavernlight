#include <memory>

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    std::unique_ptr<Player> player(g_game.getPlayerByName(recipient));
    if (!player.get()) {
        player.reset(new Player(nullptr));
        
        if (!IOLoginData::loadPlayerByName(player.get(), recipient)) {
            player.reset();
            return;
        }
    }   

    std::unique_ptr<Item> item (Item::CreateItem(itemId));
    if (!item.get()) {
        item.reset();
        return;
    }
    
    g_game.internalAddItem(player->getInbox(), item.get(), INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}