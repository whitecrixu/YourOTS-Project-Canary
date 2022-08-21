local internalNpcName = "Yaman"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 103
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
	{ itemName = "ankh", clientId = 3077, sell = 100 },
	{ itemName = "dragon necklace", clientId = 3085, buy = 1000, sell = 100, count = 200 },
	{ itemName = "dwarven ring", clientId = 3097, buy = 2000, sell = 100 },
	{ itemName = "energy ring", clientId = 3051, buy = 2000, sell = 100 },
	{ itemName = "glacial rod", clientId = 16118, sell = 6500 },
	{ itemName = "hailstorm rod", clientId = 3067, sell = 3000 },
	{ itemName = "life ring", clientId = 3052, buy = 900, sell = 50 },
	{ itemName = "might ring", clientId = 3048, buy = 5000, sell = 250, count = 20 },
	{ itemName = "moonlight rod", clientId = 3070, sell = 200 },
	{ itemName = "muck rod", clientId = 16117, sell = 6000 },
	{ itemName = "mysterious fetish", clientId = 3078, sell = 50 },
	{ itemName = "necrotic rod", clientId = 3069, sell = 1000 },
	{ itemName = "northwind rod", clientId = 8083, sell = 1500 },
	{ itemName = "protection amulet", clientId = 3084, buy = 700, sell = 100, count = 250 },
	{ itemName = "ring of healing", clientId = 3098, buy = 2000, sell = 100 },
	{ itemName = "silver amulet", clientId = 3054, buy = 100, sell = 50, count = 200 },
	{ itemName = "snakebite rod", clientId = 3066, sell = 100 },
	{ itemName = "springsprout rod", clientId = 8084, sell = 3600 },
	{ itemName = "strange talisman", clientId = 3045, buy = 100, sell = 30, count = 200 },
	{ itemName = "terra rod", clientId = 3065, sell = 2000 },
	{ itemName = "time ring", clientId = 3053, buy = 2000, sell = 100 },
	{ itemName = "underworld rod", clientId = 8082, sell = 4400 }
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