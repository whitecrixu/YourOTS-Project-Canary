local internalNpcName = "Alesar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 80
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = 'People of Thais, bring honour to your king by fighting in the orc war!' },
	{ text = 'The orcs are preparing for war!!!' }
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:setMessage(MESSAGE_GREET, "LONG LIVE KING TIBIANUS!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "I buy swords, clubs, axes, helmets, boots, legs, shields and armors.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "ancient shield", clientId = 3432, buy = 5000, sell = 900 },
	{ itemName = "black shield", clientId = 3429, sell = 800 },
	{ itemName = "bonebreaker", clientId = 7428, sell = 10000 },
	{ itemName = "dark armor", clientId = 3383, buy = 1500, sell = 400 },
	{ itemName = "dark helmet", clientId = 3384, buy = 1000, sell = 250 },
	{ itemName = "dragon hammer", clientId = 3322, sell = 2000 },
	{ itemName = "dreaded cleaver", clientId = 7419, sell = 15000 },
	{ itemName = "giant sword", clientId = 3281, sell = 17000 },
	{ itemName = "haunted blade", clientId = 7407, sell = 8000 },
	{ itemName = "ice rapier", clientId = 3284, buy = 5000 },
	{ itemName = "knight armor", clientId = 3370, sell = 5000 },
	{ itemName = "knight axe", clientId = 3318, sell = 2000 },
	{ itemName = "knight legs", clientId = 3371, sell = 5000 },
	{ itemName = "mystic turban", clientId = 3574, sell = 150 },
	{ itemName = "onyx flail", clientId = 7421, sell = 22000 },
	{ itemName = "ornamented axe", clientId = 7411, sell = 20000 },
	{ itemName = "poison dagger", clientId = 3299, sell = 50 },
	{ itemName = "scimitar", clientId = 3307, sell = 150 },
	{ itemName = "serpent sword", clientId = 3297, buy = 6000, sell = 900 },
	{ itemName = "skull staff", clientId = 3324, sell = 6000 },
	{ itemName = "strange helmet", clientId = 3373, sell = 500 },
	{ itemName = "titan axe", clientId = 7413, sell = 4000 },
	{ itemName = "tower shield", clientId = 3428, sell = 8000 },
	{ itemName = "vampire shield", clientId = 3434, sell = 15000 },
	{ itemName = "warrior helmet", clientId = 3369, sell = 5000 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Bought %ix %s for %i %s.", amount, name, totalCost, ItemType(npc:getCurrency()):getPluralName():lower()))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, subtype, amount, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)