# Quitter son équipe (utilisable uniquement en lobby)
execute unless score #game tdm_state matches 0 run tellraw @s ["",{"text":"[TDM] ","color":"gold","bold":true},{"text":"Impossible de quitter en pleine partie !","color":"red"}]
execute unless score #game tdm_state matches 0 run return 0

tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"selector":"@s","color":"yellow"},{"text":" a quitté son équipe.","color":"gray"}]
team leave @s
scoreboard players set @s tdm_dead 0
scoreboard players set @s tdm_kills 0
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
