local mType = Game.createMonsterType("pharaoh")
local monster = {}

monster.name = "Pharaoh"
monster.description = "Pharaoh"
monster.experience = 1650
monster.outfit = {
	lookType = 90,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1600
monster.maxHealth = 1600
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6025
monster.speed = 320
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 2000,
	chance = 7,
	{text = "You will become a feast for my maggots.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -60, maxDamage = -251},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -200, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -292, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="condition", interval = 1000, chance = 15, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -34, maxDamage = -34, radius = 5, target = false, effect = CONST_ME_POISONAREA},
	{name ="speed", interval = 1000, chance = 6, speed = {min = -400, max = -400}, duration = 20000, range = 7, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 20,
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 150, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2148, chance = 91000, maxCount = 238, description = "gold coin"},
	{id = 2411, chance = 20000, description = "poison dagger"},
	{id = 2149, chance = 9000, maxCount = 3, description = "small emerald"},
	{id = 7591, chance = 8000, description = "great health potion"},
	{id = 2169, chance = 4320, description = "time ring"},
	{id = 2409, chance = 3600, description = "serpent sword"},
	{id = 2451, chance = 1200, description = "djinn blade"},
	{id = 2155, chance = 240, description = "green gem"},
	{id = 11207, chance = 100, description = "mini mummy"}
}

mType:register(monster)
