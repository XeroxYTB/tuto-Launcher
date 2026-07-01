# ══════════════════════════════════════════
# TDM - TICK DE JEU (partie active)
# ══════════════════════════════════════════

# 1. Détecter les nouvelles morts
execute as @a[team=red,scores={tdm_deaths=1..}] run function tdm:game/on_death
execute as @a[team=blue,scores={tdm_deaths=1..}] run function tdm:game/on_death
scoreboard players set @a tdm_deaths 0

# 2. Forcer spectateur pour les morts qui ont respawn
gamemode spectator @a[scores={tdm_dead=1},gamemode=!spectator]

# 3. Joueurs sans équipe → spectateurs
gamemode spectator @a[team=!red,team=!blue,gamemode=!spectator]

# 4. Compter les vivants par équipe
scoreboard players set #red_alive tdm_count 0
scoreboard players set #blue_alive tdm_count 0
execute as @a[team=red,scores={tdm_dead=0}] run scoreboard players add #red_alive tdm_count 1
execute as @a[team=blue,scores={tdm_dead=0}] run scoreboard players add #blue_alive tdm_count 1

# 5. Vérifier la victoire
function tdm:game/check_victory

# 6. Affichage actionbar (vivants par équipe)
title @a actionbar ["",{"text":"❤ Rouge: ","color":"red"},{"score":{"name":"#red_alive","objective":"tdm_count"},"color":"red","bold":true},{"text":" vivant(s)","color":"red"},{"text":"  ⚔  ","color":"gold"},{"text":"❤ Bleu: ","color":"blue"},{"score":{"name":"#blue_alive","objective":"tdm_count"},"color":"blue","bold":true},{"text":" vivant(s)","color":"blue"}]
