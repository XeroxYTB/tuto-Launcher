# ══════════════════════════════════════════
# TDM - VICTOIRE ROUGE !
# ══════════════════════════════════════════

# État terminé
scoreboard players set #game tdm_state 3

# Titre de victoire
title @a times 10 80 20
title @a[team=red] title {"text":"🏆 VICTOIRE ! 🏆","color":"gold","bold":true}
title @a[team=red] subtitle {"text":"L'équipe Rouge remporte la partie !","color":"red"}
title @a[team=blue] title {"text":"DÉFAITE","color":"dark_red","bold":true}
title @a[team=blue] subtitle {"text":"L'équipe Rouge a gagné...","color":"gray"}
title @a[team=!red,team=!blue] title {"text":"VICTOIRE ROUGE","color":"red","bold":true}

# Effets pour les gagnants
effect give @a[team=red] minecraft:glowing 15 0 false
execute as @a[team=red] at @s run particle minecraft:firework ~ ~1 ~ 1 1 1 0.5 50
execute as @a[team=red] at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1

# Son global
execute as @a at @s run playsound minecraft:entity.firework_rocket.blast master @s ~ ~ ~ 1 1

# Message
tellraw @a ["",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  🏆 VICTOIRE !","color":"gold","bold":true},"\n",{"text":"  L'équipe ","color":"gray"},{"text":"ROUGE","color":"red","bold":true},{"text":" a gagné !","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  "},{"text":"/function tdm:game/reset","color":"green","clickEvent":{"action":"suggest_command","value":"/function tdm:game/reset"}},{"text":" pour relancer","color":"gray"}]

# Reset auto dans 15 secondes
schedule function tdm:game/reset 300t
