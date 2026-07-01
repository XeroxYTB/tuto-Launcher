# Rejoindre l'équipe Rouge
team join red @s
scoreboard players set @s tdm_dead 0
scoreboard players set @s tdm_kills 0

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1
title @s times 5 30 10
title @s title {"text":"Équipe ROUGE","color":"red","bold":true}
title @s subtitle {"text":"Prêt au combat !","color":"gray"}

tellraw @a ["",{"text":"[TDM] ","color":"gold","bold":true},{"selector":"@s","color":"red"},{"text":" a rejoint l'équipe ","color":"gray"},{"text":"ROUGE ","color":"red","bold":true},{"text":"!","color":"gray"}]
