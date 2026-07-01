# ══════════════════════════════════════════
# TDM - UN JOUEUR EST MORT
# Exécuté en tant que le joueur mort (@s)
# ══════════════════════════════════════════

# Ignorer si déjà marqué mort
execute if score @s tdm_dead matches 1 run return 0

# Marquer comme éliminé
scoreboard players set @s tdm_dead 1

# Passer en spectateur
gamemode spectator @s

# TP au lobby
execute at @e[tag=tdm_lobby,limit=1] run tp @s ~ ~2 ~

# Annonces selon l'équipe
execute if entity @s[team=red] run tellraw @a ["",{"text":"  ☠ ","color":"dark_red"},{"selector":"@s","color":"red"},{"text":" a été éliminé(e) !","color":"gray"}]
execute if entity @s[team=blue] run tellraw @a ["",{"text":"  ☠ ","color":"dark_blue"},{"selector":"@s","color":"blue"},{"text":" a été éliminé(e) !","color":"gray"}]

# Son pour tout le monde
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.3 0.5

# Message au joueur mort
title @s times 5 40 10
title @s title {"text":"ÉLIMINÉ","color":"red","bold":true}
title @s subtitle {"text":"Vous êtes maintenant spectateur","color":"gray"}
