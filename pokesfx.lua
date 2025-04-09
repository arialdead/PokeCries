mod_dir = ''..SMODS.current_mod.path
pfiles = NFS.getDirectoryItems(mod_dir.."assets/sounds")

for _, file in ipairs(pfiles) do
    pokemon_name = string.sub(file, 1, -5)


    SMODS.Sound({
        key = pokemon_name,
        path = file,
    }):register()
end

check_for_cry_add = function(joker, from_debuff, is_adding)
    sound_code = "pokesfx_"..joker.ability.name
    if SMODS.Sounds[sound_code] then
        G.E_MANAGER:add_event(Event({
            func = (function()
                play_sound(sound_code, 1, 0.7)
                return true
            end)
        }))
    end
 end

 check_for_cry_remove = function(joker, from_debuff, is_adding)
    sound_code = "pokesfx_"..joker.ability.name
    if SMODS.Sounds[sound_code] then
        G.E_MANAGER:add_event(Event({
            func = (function()
                play_sound(sound_code, 0.7,0.7)
                return true
            end)
        }))
    end
 end