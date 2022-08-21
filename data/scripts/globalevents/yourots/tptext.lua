local effects = {
    {position = Position(158, 47, 7), text = 'Teleport Center', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(61, 496, 7), text = 'Asmar Town', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(49, 489, 7), text = 'Shop Center', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(52, 489, 7), text = 'Training Area', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(55, 489, 7), text = 'Experiance Area', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(58, 489, 7), text = 'PvP Area', effect = CONST_ME_GROUNDSHAKER},
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()