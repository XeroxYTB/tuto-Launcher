# ══════════════════════════════════════════
# TDM - ÉGALITÉ !
# ══════════════════════════════════════════

# État terminé
scoreboard players set #game tdm_state 3

# Titre
title @a times 10 80 20
title @a title {"text":"ÉGALITÉ !","color":"yellow","bold":true}
title @a subtitle {"text":"Les deux équipes ont été éliminées !","color":"gray"}

# Son
execute as @a at @s run playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 1 0.5

# Message
tellraw @a ["",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  ⚖ ÉGALITÉ !","color":"yellow","bold":true},"\n",{"text":"  Les deux équipes ont été éliminées !","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  "},{"text":"/function tdm:game/reset","color":"green","clickEvent":{"action":"suggest_command","value":"/function tdm:game/reset"}},{"text":" pour relancer","color":"gray"}]

# Reset auto dans 10 secondes
schedule function tdm:game/reset 200t
