# Rejoindre l'équipe Bleue
team join blue @s
scoreboard players set @s tdm_dead 0
scoreboard players set @s tdm_kills 0

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
title @s times 5 30 10
title @s title {"text":"Équipe BLEUE","color":"blue","bold":true}
title @s subtitle {"text":"Prêt au combat !","color":"gray"}

tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"selector":"@s","color":"blue"},{"text":" a rejoint l'équipe ","color":"gray"},{"text":"BLEUE ","color":"blue","bold":true},{"text":"!","color":"gray"}]
