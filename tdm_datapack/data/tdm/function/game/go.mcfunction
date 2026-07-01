# ══════════════════════════════════════════
# TDM - GO ! Début réel de la partie
# ══════════════════════════════════════════

# État actif
scoreboard players set #game tdm_state 1

# Reset scores
scoreboard players set @a tdm_dead 0
scoreboard players set @a tdm_kills 0
scoreboard players set @a tdm_deaths 0

# Enlever les effets de freeze
effect clear @a[team=red]
effect clear @a[team=blue]

# Mode aventure (PvP actif, pas de casse de blocs)
gamemode adventure @a[team=red]
gamemode adventure @a[team=blue]

# Spawnpoint au lobby (pour respawn automatique des morts)
execute at @e[tag=tdm_lobby,limit=1] run spawnpoint @a[team=red] ~ ~ ~
execute at @e[tag=tdm_lobby,limit=1] run spawnpoint @a[team=blue] ~ ~ ~

# Donner les kits
execute as @a[team=red] run function tdm:game/give_kit_red
execute as @a[team=blue] run function tdm:game/give_kit_blue

# Résistance de départ (3 secondes)
effect give @a[team=red] minecraft:resistance 3 255 true
effect give @a[team=blue] minecraft:resistance 3 255 true

# Annonce
title @a times 0 30 10
title @a title {"text":"⚔ COMBAT ! ⚔","color":"gold","bold":true}
title @a subtitle {"text":"Éliminez l'équipe adverse !","color":"gray"}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 0.5 1.5
playsound minecraft:item.goat_horn.sound.0 master @a ~ ~ ~ 1 1

tellraw @a ["",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  ⚔ LA PARTIE COMMENCE ! ⚔","color":"gold","bold":true},"\n",{"text":"  Éliminez tous les joueurs adverses !","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"}]
