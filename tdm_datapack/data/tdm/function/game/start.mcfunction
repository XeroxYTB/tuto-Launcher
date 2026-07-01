# ══════════════════════════════════════════
# TDM - LANCER LA PARTIE
# ══════════════════════════════════════════

# Vérifier qu'on est en lobby
execute unless score #game tdm_state matches 0 run tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"text":"Une partie est déjà en cours !","color":"red"}]
execute unless score #game tdm_state matches 0 run return 0

# Vérifier que les marqueurs de spawn existent
execute unless entity @e[tag=tdm_red_spawn] run tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"text":"Spawns non configurés ! Lancez d'abord ","color":"red"},{"text":"/function tdm:setup/lobby","color":"green"}]
execute unless entity @e[tag=tdm_red_spawn] run return 0

# Compter les joueurs par équipe
scoreboard players set #red_total tdm_count 0
scoreboard players set #blue_total tdm_count 0
execute as @a[team=red] run scoreboard players add #red_total tdm_count 1
execute as @a[team=blue] run scoreboard players add #blue_total tdm_count 1

# Vérifier minimum 1 joueur par équipe
execute if score #red_total tdm_count matches 0 run tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"text":"Il faut au moins 1 joueur dans l'équipe ","color":"red"},{"text":"ROUGE","color":"red","bold":true},{"text":" !","color":"red"}]
execute if score #red_total tdm_count matches 0 run return 0

execute if score #blue_total tdm_count matches 0 run tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"text":"Il faut au moins 1 joueur dans l'équipe ","color":"red"},{"text":"BLEUE","color":"blue","bold":true},{"text":" !","color":"red"}]
execute if score #blue_total tdm_count matches 0 run return 0

# Passer en état countdown (2)
scoreboard players set #game tdm_state 2

# Téléporter aux spawns d'équipe
execute as @a[team=red] at @e[tag=tdm_red_spawn,limit=1] run tp @s ~ ~ ~
execute as @a[team=blue] at @e[tag=tdm_blue_spawn,limit=1] run tp @s ~ ~ ~

# Joueurs sans équipe → spectateurs
gamemode spectator @a[team=!red,team=!blue]

# Freeze pendant le countdown
effect give @a[team=red] minecraft:slowness 5 255 true
effect give @a[team=blue] minecraft:slowness 5 255 true
effect give @a[team=red] minecraft:mining_fatigue 5 255 true
effect give @a[team=blue] minecraft:mining_fatigue 5 255 true
effect give @a[team=red] minecraft:resistance 5 255 true
effect give @a[team=blue] minecraft:resistance 5 255 true

# Countdown : 3
title @a times 0 25 5
title @a title {"text":"3","color":"red","bold":true}
title @a subtitle {"text":"Préparez-vous...","color":"gray"}
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 0.5

# Programmer la suite du countdown
schedule function tdm:game/countdown_2 20t
schedule function tdm:game/countdown_1 40t
schedule function tdm:game/go 60t
